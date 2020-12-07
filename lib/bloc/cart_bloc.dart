import 'dart:developer';

import 'package:buyer/models/cart.dart';
import 'package:buyer/models/extras.dart';
import 'package:buyer/models/product.dart';
import 'package:buyer/services/cart_service.dart';
import 'package:buyer/services/poducts_service.dart';
import 'package:buyer/utils/app_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CartEvent {}

class InitCartEvent extends CartEvent {}

class LoadCartEvent extends CartEvent {}

class AddCartEvent extends CartEvent {
  final Product product;

  AddCartEvent(this.product);
}

class ClearCartEvent extends CartEvent {}

class SetCountCartEvent extends CartEvent {
  String productID;
  int idx;
  int count;

  SetCountCartEvent(this.productID, this.idx, this.count);
}

class CartState {
  List<CartProducts> productCartList;
  List<Product> productList;
  int totalPrice;
  int deliveryFee;
  String errorMsg;
  bool isLoading;

  CartState({
    this.productCartList,
    this.productList,
    this.errorMsg = '',
    this.isLoading = false,
    this.totalPrice = 0,
    this.deliveryFee = 0,
  });

  factory CartState.init() =>
      CartState(productCartList: new List<CartProducts>(), productList: new List<Product>(), errorMsg: '', isLoading: false, totalPrice: 0, deliveryFee: 0);

  CartState submitting() => _setProps(isLoading: true);

  CartState _setProps(
      {List<CartProducts> productCartList, List<Product> productList, int totalPrice, int deliveryFee, String errorMsg, bool isLoading,}) =>
      CartState(
        productCartList: productCartList ?? this.productCartList,
        productList: productList ?? this.productList,
        totalPrice: totalPrice ?? getTotalPrice(),
        deliveryFee: deliveryFee ?? getDeliveryFee(),
        errorMsg: errorMsg ?? this.errorMsg,
        isLoading: isLoading ?? this.isLoading,
      );

  int getTotalPrice() {
    int val = 0;
    if(productList==null)
      return 0;
    for(int i = 0; i < productList.length; i++) {
      int extras = 0;
      for (int j = 0; j < productCartList[i].options.length; j++) {
        extras = extras + productCartList[i].options.values.toList()[j];
      }
      val += (productList[i].price+extras)*productCartList[i].quantity;
    }
    return val;
  }

  int getDeliveryFee(){
    if(totalPrice >= 0 && totalPrice <= 9999)
      deliveryFee = 3000;
    else if(totalPrice > 9999 && totalPrice <= 29999)
      deliveryFee = 2000;
    else if(totalPrice > 29999 && totalPrice <= 49999)
      deliveryFee = 1000;
    else
      deliveryFee = 0;
    return deliveryFee;
  }

  CartState success(
      {List<CartProducts> productCartList, List<Product> productList, int totalPrice, int deliveryFee}) =>
      _setProps(
        productCartList: productCartList,
        productList: productList,
        totalPrice: totalPrice,
        deliveryFee: deliveryFee,
        errorMsg: '',
        isLoading: false,
      );

  CartState unprocessed(String errorMsg) =>
      CartState.init()..errorMsg = errorMsg;

}

class CartBloc extends Bloc<CartEvent, CartState> {

  CartBloc() : super(CartState());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is InitCartEvent) yield* mapEventInitToState(event);
    if (event is AddCartEvent) yield* mapEventAddToState(event);
    if (event is ClearCartEvent) yield* mapEventClearToState(event);
    if (event is LoadCartEvent) yield* mapEventLoadToState(event);
    if (event is SetCountCartEvent) yield* mapEventSetCountToState(event);
  }

  Stream<CartState> mapEventInitToState(InitCartEvent event) async* {
    yield CartState.init();
  }

  Stream<CartState> mapEventAddToState(AddCartEvent event) async* {
    yield state.submitting();
    if (addToCart(event.product)) {
      state.productList.add(event.product);
      yield state.success(productList: state.productList);
    } else {
      yield state.unprocessed('장바구니 담기 실패');
    }
  }

  Stream<CartState> mapEventClearToState(ClearCartEvent event) async* {
    yield state.submitting();
    try{
      await clearCart();
      yield CartState.init();
    } catch(e){
      yield state.unprocessed('삭제 실패');
    }
  }

  Stream<CartState> mapEventLoadToState(LoadCartEvent event) async* {
    yield state.submitting();

    try{
//      Stream<DocumentSnapshot> streamsnapshot = getCartItems();
      await for(DocumentSnapshot data in getCartItems()){
        Cart cart = Cart.fromDocument(data);
        List<CartProducts> productCartList = cart.products;
        if(productCartList != null)
        {
          List<Product> productList = new List<Product>();
          for(CartProducts cartProduct in productCartList){
            DocumentSnapshot snapshot = await getProduct(cartProduct.productID);
            Product product = Product.fromDocument(snapshot);
            productList.add(product);
          }
          int val = 0;
          for(int i = 0; i < productList.length; i++) {
            int extras = 0;
            for (int j = 0; j < productCartList[i].options.length; j++) {
              extras = extras + productCartList[i].options.values.toList()[j];
            }
            val += (productList[i].price+extras)*productCartList[i].quantity;
          }
          int deliveryFee = getDeliveryFee(val);
          yield state.success(productCartList: productCartList, productList: productList, totalPrice: val, deliveryFee: deliveryFee);
          return;
        }

        return;
      }
    } catch (e) {
      yield state.unprocessed('접속 실패');
    }
  }

  Stream<CartState> mapEventSetCountToState(SetCountCartEvent event) async*{
    yield state.submitting();
    try{
      print(event.idx);
      state.productList[event.idx].quantity = event.count;
      state.productCartList[event.idx].quantity = event.count;

      List<String> keys = state.productCartList[event.idx].options.keys.toList();
      List values = state.productCartList[event.idx].options.values.toList();
      for (int i = 0; i < keys.length; i++)
        state.productList[event.idx].extras.add(Extras(
          selected: true,
          key: keys[i],
          value: values[i],
        ));
      int val = 0;
      for(int i = 0; i < state.productList.length; i++) {
        int extras = 0;
        for (int j = 0; j < state.productCartList[i].options.length; j++) {
          extras = extras + state.productCartList[i].options.values.toList()[j];
        }
        val += (state.productList[i].price+extras)*state.productCartList[i].quantity;
      }
      int deliveryFee = getDeliveryFee(val);
      yield state.success(productCartList:state.productCartList, productList: state.productList, totalPrice: val, deliveryFee: deliveryFee);
      await addToCart(state.productList[event.idx]);
    } catch(e){
      yield state.unprocessed('오류가 발생하였습니다.');
    }
  }

  int getDeliveryFee(int totalPrice){
    int deliveryFee = 0;
    if(totalPrice >= 0 && totalPrice <= 9999)
      deliveryFee = 3000;
    else if(totalPrice > 9999 && totalPrice <= 29999)
      deliveryFee = 2000;
    else if(totalPrice > 29999 && totalPrice <= 49999)
      deliveryFee = 1000;
    else
      deliveryFee = 0;
    return deliveryFee;
  }
}