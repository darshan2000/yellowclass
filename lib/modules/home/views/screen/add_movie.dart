
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:yellow_class/modules/home/data/services/movie_service.dart';
import 'package:yellow_class/utilities/app_text.dart';
import 'package:yellow_class/utilities/colors.dart';

class AddMovie extends StatefulWidget {
  const AddMovie({Key? key}) : super(key: key);

  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  final _formKey = GlobalKey<FormState>();
  late String name, dir, img;
 // late Future<File> imageFile;

  @override
  Widget build(BuildContext context) {
    MovieService movieService = Provider.of<MovieService>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: ThemeColors.whiteColor,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:Icon(Icons.keyboard_backspace, color: ThemeColors.subSecondaryColor,)),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width/30),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              AppText.SubHeading(text: 'Add Movie', size: 20.0),
              SizedBox(height: 3,),
              AppText.Content(text: "Add a new movie to your list", size: 14.0, color: ThemeColors.subSecondaryColor),
              SizedBox(height: 50,),
              TextFormField(
                onChanged: (val){
                  name = val;
                },
                validator: (val){
                  if(val!.isEmpty || val == ''){
                    return 'Please enter a movie';
                  }
                  else{
                    return null;
                  }
                },
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: 'Movie Name',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors. white, width: 2.0),
                  )
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                onChanged: (val){
                  dir = val;
                },
                validator: (val){
                  if(val!.isEmpty || val == ''){
                    return 'Please enter a Director';
                  }
                  else{
                    return null;
                  }
                },
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    labelText: 'Director',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors. white, width: 2.0),
                    )
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                onChanged: (val){
                  img = val;
                },
                validator: (val){
                  if(val!.isEmpty || val == ''){
                    return 'Please enter a poster';
                  }
                  else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Movie Poster',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors. white, width: 2.0),
                    )
                ),
              ),
              SizedBox(height: 80,),
              Center(
                child: GestureDetector(
                    onTap: (){
                      if (_formKey.currentState!.validate()) {
                        movieService.addMovie(name, dir,img);
                        Fluttertoast.showToast(msg: 'Movie added!',     fontSize: 20,
                            textColor: Colors.white,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_LONG);
                        Navigator.pop(context);
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
                          AppText.SubHeading(text: 'Add movie to my list', size: 15.0, color: ThemeColors.whiteColor)
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
