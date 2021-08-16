

import 'package:hive/hive.dart';
import 'package:yellow_class/modules/home/data/models/movie_model.dart';

class Boxes{
  static Box<MovieModel> getMovies() =>
      Hive.box<MovieModel>('movies');
}