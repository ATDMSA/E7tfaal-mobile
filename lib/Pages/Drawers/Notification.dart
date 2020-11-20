import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Pages/Drawers/Drawer.dart';
import 'package:celebration/Pages/HomePage.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int selectIndex;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            CustomAppBar(
              onPress: () => _drawerKey.currentState.openDrawer(),
              title: 'الإشعارات',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 10,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context , index){
                    return messNotification();
                  }),
            )
          ],
        ),);
  }
  Widget messNotification (){
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.GreyLightsColor),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Column(
              children: [
                Image(
                    image: AssetImage(
                        'assets/images/iconNotifition.png'))
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'فريق عمل إحتفال',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'سبتمبر 3 2020 3:23 م',
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                Text(
                  'يسرنا تهنئتكم بحلول شهر رمضان المبارك',
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
