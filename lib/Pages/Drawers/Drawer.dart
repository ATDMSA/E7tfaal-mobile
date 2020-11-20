import 'package:cached_network_image/cached_network_image.dart';
import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Pages/Drawers/AboutUs.dart';
import 'package:celebration/Pages/Drawers/ProfilePage.dart';
import 'package:celebration/Pages/Drawers/Promotion.dart';
import 'package:celebration/Pages/Drawers/Reservation.dart';
import 'package:celebration/Pages/Drawers/Notification.dart';
import 'package:celebration/Pages/Drawers/Support.dart';
import 'package:celebration/Pages/Auth/Login_page.dart';
import 'package:celebration/Pages/SpecialRooms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  var listOfItem = [
    {
      'image': Resources.DRAWER_Homepage,
      'text': 'قاعات إحتفال',
    },
    {
      'image': Resources.DRAWER_Promotion,
      'text': 'إعلانات إحتفال',
    },
    {
      'image': Resources.DRAWER_Reservation,
      'text': 'حجوزاتى',
    },
    {
      'image': Resources.DRAWER_Favourite,
      'text': 'المفضله',
    },
    {
      'image': Resources.DRAWER_Notification,
      'text': 'إشعارات النظام',
    },
    {
      'image': Resources.DRAWER_AboutUs,
      'text': 'من نحن',
    },
    {
      'image': Resources.DRAWER_Policy,
      'text': 'الشروط والأحكام',
    },
    {
      'image': Resources.DRAWER_Money,
      'text': 'حسابتنا البنكيه',
    },
    {
      'image': Resources.DRAWER_question_answer,
      'text': 'تحدث مع إحتفال',
    },
    {
      'image': Resources.DRAWER_support,
      'text': 'تواصل معنا',
    },
    {
      'image': Resources.DRAWER_logout,
      'text': 'تسجيل الخروج',
    },
  ];

  int selectIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.GreyLightsColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: listOfItem.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectIndex = index;
                      });
                    },
                    child: _createDrawerItem(
                        image: listOfItem[index]['image'],
                        text: listOfItem[index]['text'],
                        index: index
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  Widget _createHeader() {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
      },
      child: UserAccountsDrawerHeader(
        decoration: BoxDecoration(
            color: AppColors.YellowColor,
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(Resources.DRAWER_BG))),
        currentAccountPicture: Avatar(),
        accountName: Text(
          'تركي الحربي',
          style: TextStyle(
              fontSize: 21.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {String image, String text, GestureTapCallback onTap ,int index}) {
    bool selected =selectIndex == index;
    return InkWell(
      onTap: (){
        if ( index == 0){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SpecialRooms(title: LocalKeys.SpecialRooms,)));
        }else if(index == 1){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Promotion()));
        }else if(index == 2){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Reservation()));
        }else if(index == 3){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SpecialRooms(title: LocalKeys.SpecialRoomsFAVORIT,)));
        }else if(index == 4){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage()));
        }else if(index == 5 || index == 6){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs(title: index == 5 ? 'من نحن':'الشروط والأحكام',)));
        }else if(index == 7){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Promotion()));
        }else if(index == 8){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Support()));
        }else if(index == 9){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Promotion()));
        }else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
        }

      },
      child: Container(
        color: selected ==false  ? Colors.transparent : AppColors.whiteColor,
        child: ListTile(
          title: Row(
            children: <Widget>[
              CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.PurpleColor,
                 // selected ==false  ? AppColors.whiteColor : AppColors.YellowColor,
                  child: SvgPicture.asset(
                    image
                  )),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 14,  color: selected ==false  ? AppColors.PurpleColor : AppColors.YellowColor),
                ),
              )
            ],
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}


class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(100)),
      child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xffe3e3e3),
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 3.0, //extend the shadow
                offset: Offset(
                  1.0, // Move to right 10  horizontally
                  1.0, // Move to bottom 10 Vertically
                ),
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          height: 70,
          width: 70,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:
                "https://images.assetsdelivery.com/compings_v2/4zevar/4zevar1604/4zevar160400009.jpg",
            placeholder: (context, url) => Center(
                child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      backgroundColor: AppColors.PurpleColor,
                    ))),
            //  errorWidget: (context, url, error) => Icon(Icons.error),
          )),
    );
  }
}
