import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:yellow_class/modules/home/data/services/auth.dart';
import 'package:yellow_class/modules/home/views/screen/homepage.dart';
import 'package:yellow_class/utilities/app_text.dart';
import 'package:yellow_class/utilities/colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();
  late String email, pass;
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
          /*  mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,*/
            children: [
              SizedBox(height: 40,),
              Container(
                height: 150, width: 150,
                child: Lottie.asset('assets/ani/movie.json'),
              ),
              SizedBox(height: 20,),

              Center(child: AppText.SubHeading(text: "It's movie time!", size: 25.0)),
              SizedBox(height: 30,),
              Center(child: AppText.Content(text: 'Login to continue', size: 15.0)),

              SizedBox(height: 60,),
              TextFormField(
                onChanged: (val){
                  email = val;
                },
                decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors. white, width: 2.0),
                    )
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                onChanged: (val){
                  pass = val;
                },
                obscureText: true,
                decoration: InputDecoration(

                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors. white, width: 2.0),
                    )
                ),
              ),
              SizedBox(height: 50,),

              GestureDetector(
                onTap: ()async{
                  _formKey.currentState!.save();
                  _auth.Login(email: email, password: pass);
                  dynamic result = await _auth.signIn();

                  if(result==null){
                    Fluttertoast.showToast(msg: 'Wrong Credentials',     fontSize: 20,
                        textColor: Colors.white,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_LONG);
                  }
                  else{
                    print(result);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    Fluttertoast.showToast(msg: 'Logged in!',     fontSize: 20,
                        textColor: Colors.white,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_LONG);
                  }
                },

                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: ThemeColors.blue,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        auth.isLog ? CircularProgressIndicator() :AppText.SubHeading(text: 'Login', size: 16.0, color: ThemeColors.whiteColor)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
