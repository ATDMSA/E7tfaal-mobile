import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Pages/Auth/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'SpecialRoomsDetails.dart';

class SpecialRooms extends StatefulWidget {
  String title ;
  SpecialRooms({this.title});
  @override
  _SpecialRoomsState createState() => _SpecialRoomsState();
}

class _SpecialRoomsState extends State<SpecialRooms> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: Drawer(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // appbar

          CustomAppBar(
            onPress: () => _drawerKey.currentState.openDrawer(),
            onPressFilter:()=>  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())),
            title: widget.title,
            icon: IconData(
              0xE802,
              fontFamily: 'AppIcon',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return SpecialItem();
                }),
          )
        ],
      ),
    );
  }

  Widget SpecialItem() {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => SpecialRoomsDetails())),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.GreyLightColor,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  color: AppColors.PurpleColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.star_border,
                      color: AppColors.YellowColor,
                      size: 18,
                    ),
                    Text(
                      'قصر الشوق',
                      style: TextStyle(
                          fontSize: 17,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'خصم',
                            style:
                            TextStyle(fontSize: 7, color: AppColors.YellowColor),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' 50',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12, color: AppColors.YellowColor),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                            'assets/images/hot-sale.svg'
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image(image: AssetImage(Resources.HOME_PAGES_ROOM1)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Image(image: AssetImage(Resources.HOME_PAGES_ROOM1)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Image(image: AssetImage(Resources.HOME_PAGES_ROOM1)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'يبدأ من',
                            style: TextStyle(
                                fontSize: 10,
                                color: AppColors.YellowColor,
                                decoration: TextDecoration.underline),
                          ),
                          RichText(
                            text: TextSpan(
                              text: '500',
                              style: TextStyle(
                                  fontSize: 33, color: AppColors.PurpleColor),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'SAR',
                                  style: TextStyle(
                                      fontSize: 9,
                                      color: AppColors.PurpleColor),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'آخر تحديث منذ 21 دقيقه',
                                style: TextStyle(
                                    color: AppColors.PurpleColor, fontSize: 9),
                              ),
                              Icon(
                                Icons.access_time,
                                color: AppColors.PurpleColor,
                                size: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.YellowColor,
                                size: 20,
                              ),
                              Text(
                                '5 / 4',
                                style: TextStyle(
                                    color: AppColors.YellowColor, fontSize: 11),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '500',
                                      style: TextStyle(
                                          color: AppColors.PurpleColor,
                                          fontSize: 13),
                                    ),
                                    Image(image: AssetImage('assets/images/wc.png',),),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '500',
                                      style: TextStyle(
                                          color: AppColors.PurpleColor,
                                          fontSize: 13),
                                    ),
                                    Image(image: AssetImage('assets/images/wc1.png',),),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '3',
                                      style: TextStyle(
                                          color: AppColors.PurpleColor,
                                          fontSize: 13),
                                    ),
                                    Image(image: AssetImage('assets/images/washing-hands.png',),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'حى الرحمانية بجوار البيك - جدة',
                                style: TextStyle(
                                    color: AppColors.PurpleColor, fontSize: 9),
                              ),
                              Icon(
                                Icons.location_on,
                                color: AppColors.PurpleColor,
                                size: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
