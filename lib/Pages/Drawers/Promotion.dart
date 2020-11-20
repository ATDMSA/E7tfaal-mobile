import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Pages/Drawers/Alqush.dart';
import 'package:celebration/Pages/Drawers/Drawer.dart';
import 'package:celebration/Pages/HomePage.dart';
import 'package:flutter/material.dart';

class Promotion extends StatefulWidget {
  @override
  _PromotionState createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
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
        body:ListView(
          padding: EdgeInsets.zero,
          children: [
            CustomAppBar(
              onPress: () => _drawerKey.currentState.openDrawer(),
              icon: IconData(
                0xE802,
                fontFamily: 'AppIcon',
              ),
              title: LocalKeys.DRAWER_PROMOTION,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image(
                        image: AssetImage(
                          Resources.HOME_PAGES_splash,
                        ),fit: BoxFit.fitWidth,),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'احجز الأن',
                              style: Styles.appbarTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  decoration:
                                  TextDecoration.underline),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, right: 50),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius:
                                    BorderRadius.circular(10)),
                                padding: EdgeInsets.all(3),
                                child: Text(
                                  'خصم 50%',
                                  style: TextStyle(
                                      fontSize: 19,
                                      color:
                                      AppColors.PurpleDarkColor,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: listItemPromotion.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectIndex = index;
                      });
                    },
                    child: itemPromotion(
                        title: listItemPromotion[index]['title'],
                        index: index
                    ),
                  );
                })
          ],
        ));
  }

  Widget itemPromotion({String title , int index}) {
    bool selected = selectIndex == index;
    return InkWell(
      onTap: (){
        if ( index == 0){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Promotion()));
        }else if(index == 1){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Promotion()));
        }else {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Alqush()));
        }
      },

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                      image: AssetImage(
                        Resources.HOME_PAGES_splash,
                      ),fit: BoxFit.fitWidth,),
                ),
                Text(
                  title,
                  style: Styles.appbarTextStyle
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 37),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
