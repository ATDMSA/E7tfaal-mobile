import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Component/Widget/EduButton.dart';
import 'package:celebration/Pages/AuthToRooms/NextNewAccountRooms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NextAccountRooms extends StatefulWidget {
  final String name;
  NextAccountRooms({this.name});
  @override
  _NextAccountRoomsState createState() => _NextAccountRoomsState();
}

class _NextAccountRoomsState extends State<NextAccountRooms> {
  bool select = false;

  var infoServices = [
    {
      'title': 'مساحة قاعة قسم النساء',
      'value': 12,
    },
    {
      'title': 'مساحة قاعة قسم النساء',
      'value': 12,
    },
    {
      'title': 'مساحة قاعة قسم النساء',
      'value': 12,
    },
    {
      'title': 'مساحة قاعة قسم النساء',
      'value': 12,
    },
    {
      'title': 'مساحة قاعة قسم النساء',
      'value': 12,
    },
    {
      'title': 'مساحة قاعة قسم النساء',
      'value': 12,
    },
    {
      'title': 'مساحة قاعة قسم النساء',
      'value': 12,
    },
    {
      'title': 'مساحة قاعة قسم النساء',
      'value': 12,
    },
    {
      'title': 'مساحة قاعة قسم النساء',
      'value': 12,
    },
    {
      'title': 'مساحة قاعة قسم النساء',
      'value': 12,
    },
    {
      'title': 'مساحة قاعة قسم النساء',
      'value': 12,
    },
    {
      'title': 'مساحة قاعة قسم النساء',
      'value': 12,
    },
  ];

  var itemOfList = [
    {
      'image': Resources.SpecialRoomsDetails_LOGO,
      'name': 'مقدمين الضيافه',
      'selected': false,
    },
    {
      'image': Resources.SpecialRoomsDetails_LOGO,
      'name': 'خدمة الداجي',
      'selected': false,
    },
    {
      'image': Resources.SpecialRoomsDetails_LOGO,
      'name': 'بلكونة العروس',
      'selected': false,
    },
    {
      'image': Resources.SpecialRoomsDetails_LOGO,
      'name': 'خدمة المطبخ',
      'selected': false,
    },
    {
      'image': Resources.SpecialRoomsDetails_LOGO,
      'name': 'غرفة العروس',
      'selected': false,
    },
    {
      'image': Resources.SpecialRoomsDetails_LOGO,
      'name': 'خدمة الكوش',
      'selected': false,
    },
    {
      'image': Resources.SpecialRoomsDetails_LOGO,
      'name': 'خدمة البوفيه',
      'selected': false,
    },
    {
      'image': Resources.SpecialRoomsDetails_LOGO,
      'name': 'ساحات خارجية',
      'selected': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: AppColors.customGradient,
              image: DecorationImage(
                  image: AssetImage(Resources.FORGET_PASSWORD_BG3_IMAGE),
                  fit: BoxFit.fill),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // appbar

                CustomAppBar(
                  title: LocalKeys.NEW_ACCOUNT,
                ),
                SizedBox(
                  height: 30,
                ),
                SvgPicture.asset(Resources.NEW_ACCOUNT_INFO_IMAGE),
                SizedBox(
                  height: 30,
                ),

                Form(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
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
                                   'حدد الخدمات المتاحه',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
    GridView.count(
                              shrinkWrap: true,
                              crossAxisSpacing: 0.1,
                              mainAxisSpacing: 0.5,
                              childAspectRatio: 1.0,
                              crossAxisCount: 3,
                              physics: NeverScrollableScrollPhysics(),
                              children:
                                  List.generate(itemOfList.length, (index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      itemOfList[index]['selected'] =
                                          !itemOfList[index]['selected'];
                                    });
                                  },
                                  child: itemOfServices(
                                      name: itemOfList[index]['name'],
                                      image: itemOfList[index]['image'],
                                      index: index),
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.GreyLightColor,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                    LocalKeys.SpecialRoomsInfoOthers,
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisSpacing: 0.1,
                              mainAxisSpacing: 0.5,
                              childAspectRatio: 0.6,
                              crossAxisCount: 4,
                              physics: NeverScrollableScrollPhysics(),
                              children:
                                  List.generate(infoServices.length, (index) {
                                return Column(
                                  children: [
                                    infoOthersServices(
                                      title: infoServices[index]['title'],
                                      value: infoServices[index]['value'],
                                    ),
                                  ],
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.GreyLightColor,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                    LocalKeys.SpecialRoomsInfoPRICE,
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.PurpleColor,
                                                    width: 4),
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.GreyLightsColor,
                                              radius: 40,
                                              child: Text(
                                                'أيام الأسبوع',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: AppColors
                                                        .blackDarkColor),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                  hintText: 'السعر'),
                                            ),
                                          )
                                        ],
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.YellowColor,
                                                    width: 4),
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.GreyLightsColor,
                                              radius: 60,
                                              child: Text(
                                                'المواسم',
                                                style: TextStyle(
                                                    fontSize: 21,
                                                    color: AppColors
                                                        .blackDarkColor),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.PurpleColor,
                                                    width: 4),
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.GreyLightsColor,
                                              radius: 40,
                                              child: Text(
                                                'نهاية الأسبوع',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: AppColors
                                                        .blackDarkColor),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                  hintText: 'السعر'),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.PurpleColor,
                                                    width: 4),
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.GreyLightsColor,
                                              radius: 40,
                                              child: Text(
                                                'أيام الأسبوع',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: AppColors
                                                        .blackDarkColor),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                  hintText: 'السعر'),
                                            ),
                                          )
                                        ],
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.YellowColor,
                                                    width: 4),
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.GreyLightsColor,
                                              radius: 55,
                                              child: Text(
                                                'غير الموسم',
                                                style: TextStyle(
                                                    fontSize: 21,
                                                    color: AppColors
                                                        .blackDarkColor),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.PurpleColor,
                                                    width: 4),
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.GreyLightsColor,
                                              radius: 40,
                                              child: Text(
                                                'نهاية الأسبوع',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: AppColors
                                                        .blackDarkColor),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                  hintText: 'السعر'),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Row(
                                children: [
                                  Expanded(flex: 3, child: Container()),
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.YellowColor,
                                                    width: 4),
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.GreyLightsColor,
                                              radius: 40,
                                              child: Text(
                                                'عيد الفطر',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: AppColors
                                                        .blackDarkColor),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Expanded(flex: 3, child: Container()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.PurpleColor,
                                                    width: 4),
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.GreyLightsColor,
                                              radius: 40,
                                              child: Text(
                                                'اول يوم',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: AppColors
                                                        .blackDarkColor),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                  hintText: 'السعر'),
                                            ),
                                          )
                                        ],
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.PurpleColor,
                                                    width: 4),
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.GreyLightsColor,
                                              radius: 40,
                                              child: Text(
                                                'ثانى يوم',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: AppColors
                                                        .blackDarkColor),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                  hintText: 'السعر'),
                                            ),
                                          )
                                        ],
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.PurpleColor,
                                                    width: 4),
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.GreyLightsColor,
                                              radius: 40,
                                              child: Text(
                                                'ثالث يوم',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: AppColors
                                                        .blackDarkColor),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                  hintText: 'السعر'),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Row(
                                children: [
                                  Expanded(flex: 3, child: Container()),
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.YellowColor,
                                                    width: 4),
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.GreyLightsColor,
                                              radius: 40,
                                              child: Text(
                                                'عيد الفطر',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: AppColors
                                                        .blackDarkColor),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Expanded(flex: 3, child: Container()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.PurpleColor,
                                                    width: 4),
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.GreyLightsColor,
                                              radius: 40,
                                              child: Text(
                                                'اول يوم',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: AppColors
                                                        .blackDarkColor),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                  hintText: 'السعر'),
                                            ),
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.PurpleColor,
                                                    width: 4),
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.GreyLightsColor,
                                              radius: 40,
                                              child: Text(
                                                'ثانى يوم',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: AppColors
                                                        .blackDarkColor),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                  hintText: 'السعر'),
                                            ),
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.PurpleColor,
                                                    width: 4),
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.GreyLightsColor,
                                              radius: 40,
                                              child: Text(
                                                'ثالث يوم',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: AppColors
                                                        .blackDarkColor),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                  hintText: 'السعر'),
                                            ),
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        AppColors.PurpleColor,
                                                    width: 4),
                                                shape: BoxShape.circle),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.GreyLightsColor,
                                              radius: 40,
                                              child: Text(
                                                'رابع يوم',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: AppColors
                                                        .blackDarkColor),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                  hintText: 'السعر'),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /* Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Transform.scale(
                                scale: 1.0,
                                child: Checkbox(
                                  value: isChecked,
                                  onChanged: (value){toggleCheckbox(value);},
                                  activeColor: AppColors.whiteColor,
                                  checkColor:AppColors.PurpleColor,
                                  tristate: false,
                                ),
                              ),

                              RichText(
                                text: TextSpan(
                                  text: LocalKeys.I_AGREE_TO,
                                  style: Styles.loginTextStyle,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: LocalKeys.TERMS_AND_CONDITIONS,
                                        style: Styles.loginTextStyle.copyWith(
                                            decoration: TextDecoration.underline,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ]),*/
                    SizedBox(
                      height: 30,
                    ),
                    EduButton(
                      style: Styles.loginTextStyle,
                      title: LocalKeys.NEXT,
                      onPressed: _newAccount,
                      bgColor: AppColors.YellowColor,
                      cornerRadius: 15,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _newAccount() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => NextNewAccountRooms()));
  }

  Widget itemOfServices({String name, String image, int index}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.GreyLightColor)),
              child: Column(
                children: [
                  SvgPicture.asset(image),
                  FittedBox(
                      child: Text(
                    name,
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColors.PurpleColor,
                        fontWeight: FontWeight.bold),
                  ))
                ],
              )),
          itemOfList[index]['selected'] == true
              ? Image(image: AssetImage('assets/images/NO.png'))
              : Container()
        ],
      ),
    );
  }

  Widget infoOthersServices({String title, int value}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 12, color: AppColors.PurpleColor),
          ),
          Icon(
            Icons.check_box_outline_blank,
            size: 50,
            color: AppColors.PurpleColor,
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(hintText: 'العدد'),
          )
        ],
      ),
    );
  }
}
