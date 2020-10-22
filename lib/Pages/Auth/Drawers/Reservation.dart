import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Widget/CustomAlertDialog.dart';
import 'package:celebration/Component/Widget/CustomAlertDialogDone.dart';
import 'package:celebration/Pages/Auth/Pages/HomePage.dart';
import 'package:celebration/Pages/Auth/Pages/SpecialRoomsDetails.dart';
import 'package:flutter/material.dart';
import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';

class Reservation extends StatefulWidget {
  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
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
             icon: IconData(
              0xE802,
              fontFamily: 'AppIcon',
            ),
            title: 'حجوزاتي',
            onPressFilter:()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()))
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child:  ListView.builder(
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
     // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SpecialRoomsDetails())),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Stack(
          children: [
            Container(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'قصر الشوق',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 17,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image(
                            image: AssetImage(Resources.HOME_PAGES_ROOM1)),
                      ),
                      Expanded(
                        flex: 2,
                        child: Image(
                            image: AssetImage(Resources.HOME_PAGES_ROOM1)),
                      ),
                      Expanded(
                        flex: 2,
                        child: Image(
                            image: AssetImage(Resources.HOME_PAGES_ROOM1)),
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

                              RichText(
                                text: TextSpan(
                                  text: '500',
                                  style: TextStyle(
                                      fontSize: 33,
                                      color: AppColors.PurpleColor),
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
                                    '5185151441',
                                    style: TextStyle(
                                        color: AppColors.redColor,
                                        fontSize: 11),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.receipt,
                                    color: AppColors.redColor,
                                    size: 15,
                                  ),
                                ],
                              ),
                              Text(
                                '15 / 9 / 2020',
                                style: TextStyle(
                                    color: AppColors.redColor, fontSize: 14),
                              )
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
                                        color: AppColors.YellowColor,
                                        fontSize: 11),
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
                                        Icon(
                                          Icons.pregnant_woman,
                                          color: AppColors.PurpleColor,
                                          size: 20,
                                        ),
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
                                        Icon(
                                          Icons.pregnant_woman,
                                          color: AppColors.PurpleColor,
                                          size: 20,
                                        ),
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
                                        Icon(
                                          Icons.wb_iridescent,
                                          color: AppColors.PurpleColor,
                                          size: 20,
                                        ),
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
                                        color: AppColors.PurpleColor,
                                        fontSize: 9),
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
                  ),

                  Text('قيد المراجعه', textAlign: TextAlign.center,style: TextStyle(
                      color: AppColors.redColor, fontSize: 12,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => CustomAlertDialogDone(
                    mess: 'هل انت متأكد من الغاء الحجز',
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.close,
                  color: AppColors.whiteColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
