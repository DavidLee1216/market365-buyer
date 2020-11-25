import 'package:buyer/models/user_model.dart' as u;
import 'package:buyer/screens/home/main_screen.dart';
import 'package:buyer/services/alert_service.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/services/user_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

signInWithGoogle(BuildContext context) async {
  try {
    showLoading(context);
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    DocumentSnapshot documentSnapshot = await checkIfUserExists();
    if (!documentSnapshot.exists) {
      await addUser(new u.User(name: user.displayName, email: user.email, photoURL: user.photoURL));
    }
    await getCurrentUser();
    closeDialog(context);
    closeOpen(context, MainScreen());
  } catch (e) {
    print(e);
    alert('Something went wrong. Sign in failed');
    //closeDialog(context);
  }
}

signUp({name, email, password, context}) async {
  try {
    showLoading(context);
    final FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
    final User user = result.user;
    assert(user != null);
    assert(await user.getIdToken() != null);
    DocumentSnapshot documentSnapshot = await checkIfUserExists();
    if (!documentSnapshot.exists) {
      await addUser(new u.User(name: email, email: email, photoURL: user.photoURL));
      await getCurrentUser();
      closeDialog(context);
      closeOpen(context, MainScreen());
    } else {
      alert('Already registered. Please sign in');
    }
  } catch (e) {
    alert(e.message);
    return null;
  }
}

signIn({String email, String password, BuildContext context}) async {
  try {
    showLoading(context);
    final FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
    final User user = result.user;
    assert(user != null);
    assert(await user.getIdToken() != null);
    await getCurrentUser();
    closeDialog(context);
    closeOpen(context, MainScreen());
  } catch (e) {
    alert(e.message);
    //closeDialog(context);
    return null;
  }
}

signOut() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  await auth.signOut();
}
