
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier{

  bool isLog = false;
  bool isSign = false;
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

  Future<void> logOut()async{
    isSign = true;
    notifyListeners();
   await _auth.signOut();
    isSign = false;
    notifyListeners();
    }

  Future Login({required String email, required String password})async{
     isLog = true;
     notifyListeners();
    try{
      UserCredential resutl =  await _auth.signInWithEmailAndPassword(email: email, password: password);

      User? user = resutl.user;
      return user;
    }
    catch(e){
      print(e);
    }
    isLog = false;
    notifyListeners();
  }


}