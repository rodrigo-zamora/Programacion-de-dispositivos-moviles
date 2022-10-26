import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /*
    * Sign in with Google
    *
    * true -> home page
    * false -> login page
  */
  bool isSignedIn() {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future signOutGoogle() async {
    await _googleSignIn.signOut();
  }

  Future signOutFirebase() async {
    await _firebaseAuth.signOut();
  }

  Future signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;

    if (kDebugMode) {
      print('User email: ${googleUser.email}');
      print('User name: ${googleUser.displayName}');
      print('User photo: ${googleUser.photoUrl}');
    }

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final authResult = await _firebaseAuth.signInWithCredential(credential);

    await _createUserCollectionFirebase(_firebaseAuth.currentUser!.uid);
  }

  Future _createUserCollectionFirebase(String uid) async {
    try {
      var userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      // If user doesn't exist, create a new user with all it's data
      if (!userDoc.exists) {
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'uid': uid,
          'name': _firebaseAuth.currentUser!.displayName,
          'email': _firebaseAuth.currentUser!.email,
          'photo': _firebaseAuth.currentUser!.photoURL,
          'createdAt': DateTime.now(),
          'updatedAt': DateTime.now(),
          'fotosList': [],
        });

        // If user exists, return
      } else {
        return;
      }
    } catch (e) {
      print(e);
    }
  }
}
