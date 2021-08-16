
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{


  late final FirebaseAuth _auth =FirebaseAuth.instance;

  Future signIn()async{
    try{
     UserCredential resutl =  await _auth.signInAnonymously();
     User? user = resutl.user;
     return user;
    }
    catch(e){
      print(e);
    }
  }

  Future Login({required String email, required String password})async{
    try{
      UserCredential resutl =  await _auth.signInWithEmailAndPassword(email: email, password: password);

      User? user = resutl.user;
      return user;
    }
    catch(e){
      print(e);
    }
  }


}