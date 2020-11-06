import 'package:buyer/models/shop.dart';
import 'package:flutter/material.dart';

class StoreDetails extends StatefulWidget {

  final Shop storeDetails;
  StoreDetails({this.storeDetails});
  @override
  _StoreDetailsState createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text(
            widget.storeDetails.name,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(widget.storeDetails.name,textScaleFactor: 1.3,),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Open/Closed',textScaleFactor: 0.8,),

                    Text(widget.storeDetails.openTime,textScaleFactor: 0.8,),

                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Closed Day',textScaleFactor: 0.8,),
                    Text(widget.storeDetails.closeDay,textScaleFactor: 0.8,),

                  ],
                ),
                SizedBox(height: 20,),
                Text(widget.storeDetails.reviews,textScaleFactor: 0.8,),
                SizedBox(height: 20,),


              ],
            ),

          )
        ],
      ),
    );
  }
}
