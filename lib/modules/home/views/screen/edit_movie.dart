import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yellow_class/modules/home/data/models/movie_model.dart';
import 'package:yellow_class/modules/home/data/services/movie_service.dart';
import 'package:yellow_class/utilities/app_text.dart';
import 'package:yellow_class/utilities/colors.dart';

class EditMovie extends StatefulWidget {
  //const EditMovie({Key? key}) : super(key: key);
final MovieModel movie;
EditMovie(this.movie);
  @override
  _EditMovieState createState() => _EditMovieState();
}
final _formKey = GlobalKey<FormState>();

class _EditMovieState extends State<EditMovie> {

  late String name='',dir='',img = '';
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    MovieService movieService = Provider.of<MovieService>(context);

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
              AppText.SubHeading(text: 'Edit you Movie', size: 20.0),
              SizedBox(height: 3,),
              AppText.Content(text: "Oops entered the wrong details?", size: 14.0, color: ThemeColors.subSecondaryColor),
              SizedBox(height: 50,),
              TextFormField(
                initialValue: widget.movie.movieName,
                onSaved:(val){
                  if(name.isEmpty){
                    name = widget.movie.movieName;
                  }
                } ,
                onChanged: (val){
                  if(val.isEmpty){
                    name = widget.movie.movieName;
                  }
                  else {
                    name = val;
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Movie Name',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors. white, width: 2.0),
                    )
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                  onSaved:(val){
        if(dir.isEmpty){
        dir = widget.movie.director;
        }
        } ,
                onChanged: (val){
                  if(val.isEmpty){
                    dir = widget.movie.director;
                  }
                  else {
                    dir = val;
                  }
                },
                initialValue: widget.movie.director,
                decoration: InputDecoration(
                    labelText: 'Director',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors. white, width: 2.0),
                    )
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                initialValue: widget.movie.imgUrl,
                onSaved:(val){
                  if(img.isEmpty){
                    img = widget.movie.imgUrl;
                  }
                } ,
                onChanged: (val){
                  if(val.isEmpty){
                    img = widget.movie.imgUrl;
                  }
                  else {
                    img = val;
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
                    _formKey.currentState!.save();
                    final MovieModel movi = MovieModel(    )
                      ..movieName = name
                      ..imgUrl = img
                      ..director = dir
                    ..timeCreated = DateTime.now().millisecondsSinceEpoch;
                    movieService.editMovie(movi, widget.movie.key );
                    Navigator.pop(context);
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
                          AppText.SubHeading(text: 'Save changes', size: 15.0, color: ThemeColors.whiteColor)
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

