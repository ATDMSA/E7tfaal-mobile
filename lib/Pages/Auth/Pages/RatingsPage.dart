import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:flutter/material.dart';

class RatingsPage extends StatefulWidget {
  @override
  _RatingsPageState createState() => _RatingsPageState();
}

class _RatingsPageState extends State<RatingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              CustomAppBar(
                title: 'التقييمات',
                onPressFilter:()=> Navigator.pop(context),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
              return ratingItem();
            })
          )
        ],
      ),
    ));
  }
  Widget ratingItem (){
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex:5,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image(
                          image:
                          AssetImage('assets/images/iconNotifition.png')),
                      SizedBox(width: 10,),
                      Text('تركي الحربي',style: TextStyle(fontSize: 17,color: AppColors.PurpleColor),),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('تعامل إحترافي وانصح بهم',style: TextStyle(fontSize: 14,color: AppColors.blackDarkColor,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Expanded(
              flex:3,
              child:  Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time,color: AppColors.PurpleColor,size: 18,),
                      SizedBox(width: 10,),
                      Text('13:30',style: TextStyle(fontSize: 14,color: AppColors.PurpleColor),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Icon(Icons.date_range,color: AppColors.PurpleColor,size: 18,),
                      SizedBox(width: 10,),
                      Text('07/07/2020',style: TextStyle(fontSize: 14,color: AppColors.PurpleColor),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.star,color: AppColors.YellowColor,size: 18,),
                      Icon(Icons.star,color: AppColors.YellowColor,size: 18,),
                      Icon(Icons.star,color: AppColors.YellowColor,size: 18,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
