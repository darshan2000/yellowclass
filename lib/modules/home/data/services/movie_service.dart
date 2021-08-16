


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:yellow_class/modules/home/data/models/movie_model.dart';
import 'package:yellow_class/modules/home/data/services/boxes.dart';

class MovieService extends ChangeNotifier{

  final List<MovieModel> movies = [];


  bool isAdding = false;

  MovieModel currentEditingMovie = MovieModel();
  bool isAuth = false;




  Future<void> addMovie(String name, String director, String imgUrl)async{
print('start');
    final movie = MovieModel()
      ..movieName = name
      ..director = director
      ..imgUrl = imgUrl
      ..timeCreated = DateTime.now().millisecondsSinceEpoch;

    final box = Boxes.getMovies();
    box.add(movie);
    print('end');
    notifyListeners();
    box.values.forEach((element) {
      print(element);
    });
  }

  saveMovie(MovieModel movieModel){
    currentEditingMovie = movieModel;
    notifyListeners();
  }

  Future<void> editMovie(MovieModel movieModel, dynamic key)async{
    print('start');

    final box = Boxes.getMovies();
    //await box.delete(key);
    box.put(key.toString(), movieModel);
    //await box.delete(key);
   //movieModel.save();
    notifyListeners();
    print('end');
  }

  Future<void> deleteMovie(MovieModel movieModel)async{
    print('start');
    print(movieModel.movieName);
    final box = Boxes.getMovies();
    await box.delete(movieModel.key);
    print('end');
    notifyListeners();
  }
}