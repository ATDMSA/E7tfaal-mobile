import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Component/Widget/EduButton.dart';
import 'package:celebration/Pages/AuthToRooms/LoginToRooms.dart';
import 'package:celebration/Pages/AuthToRooms/NewAccountRooms.dart';
import 'package:celebration/Pages/ControlBoard/BankAccounts.dart';
import 'package:celebration/Pages/ControlBoard/CanceledReservations.dart';
import 'package:celebration/Pages/ControlBoard/OffersPage.dart';
import 'package:celebration/Pages/ControlBoard/PayTheSubscriptionFees.dart';
import 'package:celebration/Pages/ControlBoard/PendingReservations.dart';
import 'package:celebration/Pages/ControlBoard/ReservationsReceived.dart';
import 'package:celebration/Pages/ControlBoard/StatusAccountRooms.dart';
import 'package:celebration/Pages/ControlBoard/SubscriptionStatus.dart';
import 'package:celebration/Pages/Drawers/AboutUs.dart';
import 'package:celebration/Pages/Drawers/Notification.dart';
import 'package:celebration/Pages/Drawers/QuestionAndAnswer.dart';
import 'package:celebration/Pages/RatingsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:celebration/Component/Widget/CustomAlertFilter.dart';

class ControlBoard extends StatefulWidget {
  @override
  _ControlBoardState createState() => _ControlBoardState();
}

class _ControlBoardState extends State<ControlBoard> {
  var itemControl = [
    {
      'image': 'assets/images/11.svg',
      'text': 'الطلبات المستلمة',
      'value': 2,
    },
    {
      'image': 'assets/images/12.svg',
      'text': 'الطلبات الملغية',
      'value': 4,
    },
    {
      'image': 'assets/images/13.svg',
      'text': 'الطلبات المعلقة',
      'value': 7,
    },
    {
      'image': 'assets/images/14.svg',
      'text': 'الإشعارات',
      'value': 9,
    },
    {
      'image': 'assets/images/15.svg',
      'text': 'التقييمات',
      'value': 10,
    },
    {
      'image': 'assets/images/16.svg',
      'text': 'حالة الإشتراك',
      'value': 5,
    },
    {
      'image': 'assets/images/17.svg',
      'text': 'الإعدادات',
      'value': 6,
    },
    {
      'image': 'assets/images/18.svg',
      'text': 'تواصل معنا ',
      'value': 2,
    },
    {
      'image': 'assets/images/19.svg',
      'text': 'حساباتنا البنكية',
      'value': 1,
    },
    {
      'image': 'assets/images/110.svg',
      'text': 'عناوين التواصل',
      'value': 1,
    },
    {
      'image': 'assets/images/111.svg',
      'text': 'الشروط واللأحكام',
      'value': 4,
    },
    {
      'image': 'assets/images/112.svg',
      'text': 'من نحن',
      'value': 5,
    },
    {
      'image': 'assets/images/113.svg',
      'text': 'تسجيل الخروج',
      'value': 1,
    },
    {
      'image': 'assets/images/114.svg',
      'text': 'آلية تقديم إعلان',
      'value': 2,
    },
    {
      'image': 'assets/images/115.svg',
      'text': 'ساسية الإستخدام',
      'value': 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          CustomAppBar(
            title: 'لوحة التحكم ',
            appAction: appBarAction.empty,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColors.GreyLightColor),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RatingsPage())),
                                child: Text(
                                  'تعليقات الزوار',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: AppColors.PurpleColor),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'قاعة مميزة',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.PurpleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColors.PurpleColor,
                                      size: 15,
                                    ),
                                    Text(
                                      'حى الرحمانية بجوار البيك - جدة',
                                      style: TextStyle(
                                          color: AppColors.PurpleColor,
                                          fontSize: 9),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 3,
                          child:Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.YellowColor,
                                          width: 4),
                                      shape: BoxShape.circle),
                                  child: Image(
                                      image: AssetImage(Resources
                                          .SpecialRoomsDetails_MARK))),

                              CircleAvatar(
                                  backgroundColor: AppColors.YellowColor,
                                  child: Icon(Icons.check,size: 40,color: AppColors.whiteColor,)),
                              // Image(image: AssetImage('assets/images/مميز.png'))
                            ],
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'يبدأ من',
                                        style: TextStyle(
                                            color: AppColors.PurpleColor,
                                            fontSize: 10,
                                            decoration:
                                            TextDecoration.underline),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'SAR',
                                        style: TextStyle(
                                            color: AppColors.PurpleColor,
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '500',
                                    style: TextStyle(
                                        color: AppColors.PurpleColor,
                                        fontSize: 31,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'خصم',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.YellowColor,
                                        fontSize: 10,
                                        decoration:
                                        TextDecoration.underline),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '50 %',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.YellowColor,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'قاعة الأسطورة',
                    style: TextStyle(
                        fontSize: 29,
                        color: AppColors.PurpleColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_half,
                        color: AppColors.PurpleColor,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.PurpleColor,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.PurpleColor,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.PurpleColor,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.PurpleColor,
                        size: 18,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(
                            fontSize: 17,
                            color: AppColors.PurpleColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: AppColors.PurpleColor,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'آخر تحديث منذ 21 دقيقه',
                        style: TextStyle(
                            color: AppColors.PurpleColor, fontSize: 9),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'حاله القاعة',
                    style: TextStyle(
                        color: AppColors.PurpleColor, fontSize: 25),
                  ),
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 0.8,
                    mainAxisSpacing: 0.2,
                    children: List.generate(itemControl.length, (index) {
                      return control(
                          image: itemControl[index]['image'],
                          text: itemControl[index]['text'],
                          value: itemControl[index]['value'],
                          index: index
                      );
                    }),
                  ),

                  EduButton(
                    title: 'تحديث المعلومات',
                    onPressed: __navigateToControlBoard,
                    bgColor: AppColors.YellowColor,
                    cornerRadius: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget control({String text, String image, int value, int index}) {
    return InkWell(
      onTap: (){
        if ( index == 0){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ReservationsReceived()));
        }else if(index == 1){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CanceledReservations()));
        }else if(index == 2){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PendingReservations()));
        }else if(index == 3){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NotificationPage()));
        }else if(index == 4){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RatingsPage()));
        }else if(index == 5){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SubscriptionStatus()));
        }else if(index == 6){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OffersPage()));
        }else if(index == 7){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>QuestionAndAnswer()));
        }else if(index == 8){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BankAccounts()));
        }else if(index == 9){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AboutUs(title: 'عناوين التواصل',)));
        }else if(index == 10 || index == 11) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
              AboutUs(title: index == 11 ? 'من نحن' : 'الشروط والأحكام',)));
        }else if(index == 12){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginToRooms()));
        }else if(index == 13){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AboutUs(title: 'آلية تقديم إعلان',)));
        }else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AboutUs(title: 'ساسية الإستخدام',)));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                        radius: 35,
                        backgroundColor: AppColors.PurpleColor,
                        child: SvgPicture.asset(image)),
                    Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: AppColors.redColor, shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                          value.toString(),
                          style: TextStyle(color: AppColors.whiteColor),
                        ))),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void __navigateToControlBoard(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => StatusAccountRooms(name:'بياناتك',)));
  }
}
