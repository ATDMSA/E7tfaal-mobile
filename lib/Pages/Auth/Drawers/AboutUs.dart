import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Pages/Auth/Drawers/Drawer.dart';
import 'package:celebration/Pages/Auth/Pages/HomePage.dart';
import 'package:flutter/material.dart';


class AboutUs extends StatefulWidget {
  String title;
  AboutUs({this.title});
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int selectIndex;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey,
        drawer: AppDrawer(),
        body:  ListView(
          padding: EdgeInsets.zero,
          children: [
            CustomAppBar(
              icon: IconData(
                0xE802,
                fontFamily: 'AppIcon',
              ),
              onPress: () => _drawerKey.currentState.openDrawer(),
              title: widget.title,
              onPressFilter:()=>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage())),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  children: [
                    Center(
                        child: Image(
                            image: AssetImage(
                                Resources.LOGIN_LOGO_IMAGE
                            ))),
                    Text('لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق "ليتراسيت" (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل "ألدوس بايج مايكر" (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.',style: TextStyle(height: 1,fontSize: 17),)
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

