import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAlertFilter.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Pages/Drawers/Drawer.dart';
import 'package:celebration/Pages/SpecialRooms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:popup_menu/popup_menu.dart';
import 'package:celebration/Pages/SpecialRoomsDetails.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  bool selected = false;


  @override
  Widget build(BuildContext context) {
    PopupMenu.context = context;
    return Scaffold(
      key: _drawerKey,
      drawer: AppDrawer(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // appbar
          CustomAppBar(
            appAction: appBarAction.filter,
            onPress: () => _drawerKey.currentState.openDrawer(),
            icon: IconData(
              0xE802,
              fontFamily: 'AppIcon',
            ),
            title: LocalKeys.HOMEPAGE_TITLE,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: SizedBox(
                    height: 170.0,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return new Image.asset(
                          Resources.HOME_PAGES_splash,
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: 6,
                      autoplay: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                        color: Color(0xffE2BBE2),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      style: Styles.loginTextStyle,
                      // controller: _password,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "أبحث عن قاعة",
                          hintStyle: TextStyle(
                              color: AppColors.blackColor, fontSize: 16),
                          suffixIcon: Icon(Icons.search,
                              color: AppColors.blackColor, size: 17)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SpecialRooms(
                                  title: LocalKeys.SpecialRooms,
                                ))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              ' القاعات المميزة ',
                              style: TextStyle(color: AppColors.PurpleColor),
                            ),
                            Icon(
                              Icons.check_circle,
                              color: AppColors.PurpleColor,
                              size: 15,
                            ),
                          ],
                        ),
                        Text('عرض المزيد',
                            style: TextStyle(color: AppColors.PurpleColor)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.GreyLightColor)),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SpecialRoom();
                        }),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
          )
        ],
      ),
    );
  }

  Widget SpecialRoom() {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        child: Column(
          children: [
            Image(
              image: AssetImage(Resources.HOME_PAGES_ROOM1),
              width: 100,
            ),
            Text(
              'قاعة النسيم',
              style: TextStyle(color: AppColors.PurpleColor, fontSize: 12),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.PurpleColor,
                  size: 15,
                ),
                Text(
                  'جدة - حي النسيم',
                  style: TextStyle(color: AppColors.PurpleColor, fontSize: 7),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.PurpleColor,
                  size: 15,
                ),
                Text(
                  '4.5',
                  style: TextStyle(color: AppColors.PurpleColor, fontSize: 11),
                ),
              ],
            ),
          ],
        ),
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
                    InkWell(
                      onTap: () {
                        setState(() {
                          selected = !selected;
                          print('selected value');
                          print(selected);
                        });
                      },
                      child: selected == false
                          ? Icon(
                              Icons.star_border,
                              color: AppColors.YellowColor,
                              size: 30,
                            )
                          : Icon(
                              Icons.star,
                              color: AppColors.YellowColor,
                              size: 30,
                            ),
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
                            style: TextStyle(
                                fontSize: 7, color: AppColors.YellowColor),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' 50',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: AppColors.YellowColor),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset('assets/images/hot-sale.svg')
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
                                    Image(
                                      image: AssetImage(
                                        'assets/images/wc.png',
                                      ),
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
                                    Image(
                                      image: AssetImage(
                                        'assets/images/wc1.png',
                                      ),
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
                                    Image(
                                      image: AssetImage(
                                        'assets/images/washing-hands.png',
                                      ),
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

  void customBackground() {}

}
