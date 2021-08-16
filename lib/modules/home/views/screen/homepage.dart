import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yellow_class/modules/home/data/models/movie_model.dart';
import 'package:yellow_class/modules/home/data/services/boxes.dart';
import 'package:yellow_class/modules/home/data/services/movie_service.dart';
import 'package:yellow_class/modules/home/views/screen/add_movie.dart';
import 'package:yellow_class/modules/home/views/screen/edit_movie.dart';
import 'package:yellow_class/modules/home/views/widgets/movie_card.dart';
import 'package:yellow_class/utilities/app_text.dart';
import 'package:yellow_class/utilities/colors.dart';
import 'package:yellow_class/utilities/timeStamp.dart';
import 'package:fluttertoast/fluttertoast.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  //final List<MovieModel> myMovie = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Hive.close();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    MovieService movieService = Provider.of<MovieService>(context);
    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMovie()));
      },
          backgroundColor: ThemeColors.blackColor,
          label: AppText.SubHeading(text: 'Add movie')),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeColors.whiteColor,
        title:             AppText.SubHeading(text: 'MyFlix', size: 20.0, color: ThemeColors.blackColor),
        centerTitle: true,
        actions:[
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.amber,
            ),
          ),
        ]
      ),
      body: ValueListenableBuilder(

          valueListenable: Hive.box<MovieModel>('movies').listenable(),
          builder: (context,Box<MovieModel> box,_) {
           // final movies = box.values.toList().cast<>()
          //  List<int> keys = movie.keys.cast<int>().toList();

            return  Padding(
        padding:  EdgeInsets.symmetric(horizontal: width/30),
        child: box.isEmpty ? Center(child: AppText.SubHeading(text: 'No movies added yet..'),) :  ListView(
          //physics: NeverScrollableScrollPhysics(),
          children: [
            AppText.SubHeading(text: 'Hello Darshan', size: 20.0),
            SizedBox(height: 5,),
            AppText.Content(text: "Here's a list of your movies", size: 16.0, color: ThemeColors.subSecondaryColor),
            SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 3),
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                MovieModel? mov = box.getAt(index);
                  return Material(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 2,
                    child: Container(
                      //height: 100,
                      width: width,
                      decoration: BoxDecoration(
                          color: ThemeColors.whiteColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          Container(
                            // height: 100,
                            width: width/4-((width/15)-6),
                            decoration: BoxDecoration(
                                color: ThemeColors.whiteColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)
                                )
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 9, horizontal: 8
                            ),
                            child: Center(
                              //child: Image.network('https://images.unsplash.com/photo-1497514440240-3b870f7341f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2760&q=80'),
                              child: Image.network(mov!.imgUrl),
                            ),
                          ),
                          Container(
                            // height: 100,
                            width: (3*(width)/4)-((width/15)-14),
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12
                            ),
                            decoration: BoxDecoration(
                                color: ThemeColors.whiteColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10), bottomRight: Radius.circular(10)
                                )              ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText.SubHeading(text: mov!.movieName, size: 15.0),
                                    GestureDetector(
                                      onTap: (){
                                        showDialog(context: context,
                                            builder: (BuildContext cxt){
                                              return AlertDialog(
                                                title: AppText.Content(text: 'Are you sure you want to delete this movie from your list?', size: 15.0, fontWeight: FontWeight.w600),
                                                titlePadding: EdgeInsets.all(11),
                                                actions: [
                                                  TextButton(onPressed: (){
                                                    Navigator.pop(context);
                                                  },
                                                      child: AppText.SubHeading(text: 'No', color: ThemeColors.blue)),
                                                  TextButton(onPressed: ()async{
                                                   await box.delete(index);
                                                    movieService.deleteMovie(mov);
                                                    Fluttertoast.showToast(msg: 'Movie deleted!',     fontSize: 20,
                                                        textColor: Colors.white,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor: Colors.black,
                                                        gravity: ToastGravity.BOTTOM,
                                                        toastLength: Toast.LENGTH_LONG);
                                                    Navigator.pop(context);
                                                  },
                                                      child: AppText.SubHeading(text: 'Yes', color: ThemeColors.blue))
                                                ],
                                              );
                                            });
                                      },
                                      child: Icon(
                                        Icons.delete, color: ThemeColors.red, size: 18,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Icon(Icons.video_call_sharp, color: ThemeColors.subSecondaryColor, size: 17),
                                    SizedBox(width: 3,),
                                    AppText.Content(text: mov!.director, color: ThemeColors.subSecondaryColor, size: 13.0),
                                  ],
                                ),
                                SizedBox(height: 3,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.access_time, color: ThemeColors.subSecondaryColor, size: 17),
                                        SizedBox(width: 3,),
                                        AppText.Content(text: DateConverter.convert(mov!.timeCreated), color: ThemeColors.subSecondaryColor, size: 13.0),
                                      ],
                                    ),
                                    GestureDetector(
                                        onTap: (){
                                          movieService.saveMovie(mov);
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditMovie(mov)));
                                        },
                                        child: AppText.Content(text: 'Edit', color: ThemeColors.blue, size: 14.5, decorationColor: ThemeColors.blue, decoration: TextDecoration.underline, fontWeight: FontWeight.w600)),
                                  ],
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                //return MovieCard();
              }, separatorBuilder: (context,index){
                return SizedBox(height: 15,);
              }, itemCount: box.length),
            ),
            SizedBox(height: 60,),

          ],
        ),
      );
          },)


      /*Padding(
        padding:  EdgeInsets.symmetric(horizontal: width/30),
        child: ListView(
          //physics: NeverScrollableScrollPhysics(),
          children: [
            AppText.SubHeading(text: 'Hello Darshan', size: 20.0),
            SizedBox(height: 5,),
            AppText.Content(text: "Here's a list of your movies", size: 16.0, color: ThemeColors.subSecondaryColor),
            SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 3),
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                return MovieCard();
              }, separatorBuilder: (context,index){
                return SizedBox(height: 15,);
              }, itemCount: 10),
            ),
            SizedBox(height: 60,),

          ],
        ),
      ),*/
    );
  }
}
