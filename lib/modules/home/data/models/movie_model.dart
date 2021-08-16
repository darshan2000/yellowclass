import 'package:hive/hive.dart';
part 'movie_model.g.dart';


@HiveType(typeId: 0)
class MovieModel extends HiveObject{
  @HiveField(0)
  late String movieName;
  @HiveField(1)
  late String director;
  @HiveField(2)
  late String imgUrl;
  @HiveField(3)
  late int timeCreated;


  //MovieModel(this.movieName, this.timeCreated, this.imgUrl, this.director);
}