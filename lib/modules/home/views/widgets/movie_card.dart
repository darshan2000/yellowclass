import 'package:flutter/material.dart';
import 'package:yellow_class/modules/home/data/models/movie_model.dart';
import 'package:yellow_class/modules/home/views/screen/edit_movie.dart';
import 'package:yellow_class/utilities/app_text.dart';
import 'package:yellow_class/utilities/colors.dart';

class MovieCard extends StatefulWidget {


  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                child: Image.network('https://cdn.shopify.com/s/files/1/0057/3728/3618/products/950e439404c3d5eddd86ae876cec83bf_949b5045-2503-4883-bcd2-ff1f31f5b14c_240x360_crop_center.progressive.jpg?v=1573588746'),
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
                    AppText.SubHeading(text: 'Pulp Fiction', size: 15.0),
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
                              TextButton(onPressed: (){
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
                    AppText.Content(text: 'Cristopher Nolan', color: ThemeColors.subSecondaryColor, size: 13.0),
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
                        AppText.Content(text: 'July 2', color: ThemeColors.subSecondaryColor, size: 13.0),
                      ],
                    ),
                    GestureDetector(
                        onTap: (){
                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>EditMovie()));
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
  }
}
