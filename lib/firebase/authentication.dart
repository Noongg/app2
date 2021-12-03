import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:test_flutter_app2/page/sign_in.dart';

class AuthenticationHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;

  get userId => auth.currentUser!.uid;

  Future postFirestore(Map<String,dynamic> data) async{
    DocumentReference<Map<String, dynamic>> reference=FirebaseFirestore.instance.collection('user').doc(userId);
    reference.set(data);
  }
  Future putFirestore(Map<String,dynamic> data) async{
    DocumentReference<Map<String, dynamic>> reference=FirebaseFirestore.instance.collection('user').doc(userId);
    reference.update(data);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential= await auth.signInWithCredential(credential);

    try{

      FirebaseFirestore.instance.collection('user').doc(userId).get().then((value) {
        if(value.data()!.containsKey('zone')){
          print("tìm thấy");
        }
        else{
          var name =userCredential.user!.displayName;
          var email =googleUser!.email;
          var img=auth.currentUser!.photoURL;

          Map<String,dynamic> data={"user_name":name,"email":email,"img":img};
          postFirestore(data);
        }
      });

    }on StateError catch(e){

    }

    return userCredential;

  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return auth.signInWithCredential(facebookAuthCredential);

  }

  //SIGN UP METHOD
  Future signUp({required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN IN METHOD
  Future signIn({required String email,required  String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future resetPassWord({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    await auth.signOut();
    Get.offAll((SignIn()));
  }

}