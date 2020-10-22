import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Pages/Auth/Drawers/Alqush.dart';
import 'package:celebration/Pages/Auth/Drawers/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Alqush extends StatefulWidget {
  @override
  _AlqushState createState() => _AlqushState();
}

class _AlqushState extends State<Alqush> {
  int selectIndex;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  var listItemPromotion = [
    {"title": "مطابخ"},
    {"title": "غرف ضيافه"},
    {"title": "كوش"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey,
        drawer: AppDrawer(),
        body: Center(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              CustomAppBar(
                onPress: () => _drawerKey.currentState.openDrawer(),
                icon: IconData(
                  0xE802,
                  fontFamily: 'AppIcon',
                ),
                title: LocalKeys.DRAWER_ALQUSH,
                onPressFilter:()=> Navigator.pop(context),
              ),
              ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {

                      },
                      child: itemPromotion(),
                    );
                  })
            ],
          ),
        ));
  }

  Widget itemPromotion() {

    return   Padding(
      padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: MediaQuery.of(context).size.width *.95,
                child: Image(
                  image: AssetImage(
                    Resources.DRAWER_Alqush,
                  ),fit: BoxFit.fitWidth,),
              ),
              Container(
                width: MediaQuery.of(context).size.width *.92,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.blackColor.withOpacity(.45),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'السليمانية للكوش',
                      style: Styles.appbarTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'احصل على عروض منا معا افضل التصاميم الحديثة كل هذا و اكثر بنصف السعر اتصل على 05023658845',
                      style: TextStyle(fontSize: 13,color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(5),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'assets/images/logdoa.svg',
                ),
                SvgPicture.asset(
                    'assets/images/twitter.svg'
                ),
                SvgPicture.asset(
                  'assets/images/logdoa.svg',
                ),
                SvgPicture.asset(
                    'assets/images/twitter.svg'
                ),
                SvgPicture.asset(
                  'assets/images/logdoa.svg',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

