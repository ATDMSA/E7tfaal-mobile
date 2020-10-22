import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAlertDialog.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Component/Widget/EduButton.dart';
import 'package:celebration/Pages/Auth/AuthToRooms/NextNewAccountRooms.dart';
import 'package:celebration/Pages/Auth/MessWelcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class NewAccountRooms extends StatefulWidget {
  @override
  _NewAccountRoomsState createState() => _NewAccountRoomsState();
}

class _NewAccountRoomsState extends State<NewAccountRooms> {

bool select;

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


  TextEditingController _firsName = TextEditingController();
  TextEditingController _familyName = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _newPassword = TextEditingController();

  String selectedSix = 'ذكر';
  String selectedCity = 'مصر';

  bool _validateDOB = false;
  TextEditingController dobContainer = new TextEditingController();

  bool isChecked = false;
  var resultHolder = 'Checkbox is UN-CHECKED';

  bool toggleCheckbox(bool value) {
    if(isChecked == false)
    {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isChecked = true;
        resultHolder = 'Checkbox is CHECKED';
      });

    }
    else
    {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isChecked = false;
        resultHolder = 'Checkbox is UN-CHECKED';
      });
    }

  }


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

                SvgPicture.asset(Resources.NEW_ACCOUNT_INFO_IMAGE),
               SizedBox(height: 30,),
                SvgPicture.asset(Resources.NEW_ACCOUNT_ICON_PERSON_IMAGE),

                SizedBox(
                  height: 20,
                ),
                Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              controller: _firsName,
                              decoration: InputDecoration(
                                hintText: 'أسم القاعة',
                                hintStyle: Styles.loginTextStyle
                                    .copyWith(color: Colors.black),
                                border: InputBorder.none,
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              controller: _familyName,
                              decoration: InputDecoration(
                                hintText: 'اسم المدير',
                                hintStyle: Styles.loginTextStyle
                                    .copyWith(color: Colors.black),
                                border: InputBorder.none,
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              controller: _phone,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: LocalKeys.PHONE_NO,
                                hintStyle: Styles.loginTextStyle
                                    .copyWith(color: Colors.black),
                                border: InputBorder.none,
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              controller: _email,
                              decoration: InputDecoration(
                                hintText: LocalKeys.EMAIL,
                                hintStyle: Styles.loginTextStyle
                                    .copyWith(color: Colors.black),
                                border: InputBorder.none,
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              controller: _password,
                              decoration: InputDecoration(
                                hintText: LocalKeys.PASSWORD,
                                hintStyle: Styles.loginTextStyle
                                    .copyWith(color: Colors.black),
                                border: InputBorder.none,
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                             // controller: _newPassword,
                              decoration: InputDecoration(
                                hintText: LocalKeys.PASSWORD_DONE,
                                hintStyle: Styles.loginTextStyle
                                    .copyWith(color: Colors.black),
                                border: InputBorder.none,
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                             // controller: _newPassword,
                              decoration: InputDecoration(
                                hintText: 'أسم الشارع',
                                hintStyle: Styles.loginTextStyle
                                    .copyWith(color: Colors.black),
                                border: InputBorder.none,
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                             // controller: _newPassword,
                              decoration: InputDecoration(
                                hintText: 'اسم معلم إضافي',
                                hintStyle: Styles.loginTextStyle
                                    .copyWith(color: Colors.black),
                                border: InputBorder.none,
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              controller: _newPassword,
                              decoration: InputDecoration(
                                hintText: 'أسم المدنية ',
                                hintStyle: Styles.loginTextStyle
                                    .copyWith(color: Colors.black),
                                border: InputBorder.none,
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                //  controller: _newPassword,
                                  decoration: InputDecoration(
                                    hintText: 'الدولة ',
                                    hintStyle: Styles.loginTextStyle
                                        .copyWith(color: Colors.black),
                                    border: InputBorder.none,
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10,right: 5),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextField(
                                  controller: _newPassword,
                                  decoration: InputDecoration(
                                    hintText:'المنطقة',
                                    hintStyle: Styles.loginTextStyle
                                        .copyWith(color: Colors.black),
                                    border: InputBorder.none,
                                    contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width *.9,
                              child: Image(
                                  image: AssetImage(Resources.SpecialRoomsDetails_MAP),fit: BoxFit.fill,),
                            )),

                        SizedBox(
                          height: 20,
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
                                        LocalKeys.SpecialRoomsSERVICES,
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
                                  childAspectRatio: 0.85,
                                  crossAxisCount: 3,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: List.generate(8, (index) {
                                    return InkWell(
                                      onTap: (){

                                      },
                                      child: itemOfServices(
                                        index
                                      ),
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
                                  children: List.generate(infoServices.length, (index) {
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
                                  padding: const EdgeInsets.only(top: 7,bottom: 7),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(color:AppColors.PurpleColor,width: 4),
                                                    shape: BoxShape.circle
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: AppColors.GreyLightsColor,
                                                  radius: 40,
                                                  child: Text('أيام الأسبوع',style: TextStyle(fontSize: 11,color: AppColors.blackDarkColor),),

                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      hintText: 'السعر'
                                                  ),
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
                                                    border: Border.all(color:AppColors.YellowColor,width: 4),
                                                    shape: BoxShape.circle
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: AppColors.GreyLightsColor,
                                                  radius: 60,
                                                  child: Text('المواسم',style: TextStyle(fontSize: 21,color: AppColors.blackDarkColor),),

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
                                                    border: Border.all(color:AppColors.PurpleColor,width: 4),
                                                    shape: BoxShape.circle
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: AppColors.GreyLightsColor,
                                                  radius: 40,
                                                  child: Text('نهاية الأسبوع',style: TextStyle(fontSize: 11,color: AppColors.blackDarkColor),),

                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      hintText: 'السعر'
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7,bottom: 7),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(color:AppColors.PurpleColor,width: 4),
                                                    shape: BoxShape.circle
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: AppColors.GreyLightsColor,
                                                  radius: 40,
                                                  child: Text('أيام الأسبوع',style: TextStyle(fontSize: 11,color: AppColors.blackDarkColor),),

                                                ),
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      hintText: 'السعر'
                                                  ),
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
                                                    border: Border.all(color:AppColors.YellowColor,width: 4),
                                                    shape: BoxShape.circle
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: AppColors.GreyLightsColor,
                                                  radius: 55,
                                                  child: Text('غير الموسم',style: TextStyle(fontSize: 21,color: AppColors.blackDarkColor),),

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
                                                    border: Border.all(color:AppColors.PurpleColor,width: 4),
                                                    shape: BoxShape.circle
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: AppColors.GreyLightsColor,
                                                  radius: 40,
                                                  child: Text('نهاية الأسبوع',style: TextStyle(fontSize: 11,color: AppColors.blackDarkColor),),

                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      hintText: 'السعر'
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7,bottom: 7),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Container()),
                                      Expanded(
                                          flex: 3,
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(color:AppColors.YellowColor,width: 4),
                                                    shape: BoxShape.circle
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: AppColors.GreyLightsColor,
                                                  radius: 40,
                                                  child: Text('عيد الفطر',style: TextStyle(fontSize: 11,color: AppColors.blackDarkColor),),

                                                ),
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child: Container()),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7,bottom: 7),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(color:AppColors.PurpleColor,width: 4),
                                                    shape: BoxShape.circle
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: AppColors.GreyLightsColor,
                                                  radius: 40,
                                                  child: Text('اول يوم',style: TextStyle(fontSize: 14,color: AppColors.blackDarkColor),),

                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      hintText: 'السعر'
                                                  ),
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
                                                    border: Border.all(color:AppColors.PurpleColor,width: 4),
                                                    shape: BoxShape.circle
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: AppColors.GreyLightsColor,
                                                  radius: 40,
                                                  child: Text('ثانى يوم',style: TextStyle(fontSize: 14,color: AppColors.blackDarkColor),),

                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      hintText: 'السعر'
                                                  ),
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
                                                    border: Border.all(color:AppColors.PurpleColor,width: 4),
                                                    shape: BoxShape.circle
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: AppColors.GreyLightsColor,
                                                  radius: 40,
                                                  child: Text('ثالث يوم',style: TextStyle(fontSize: 14,color: AppColors.blackDarkColor),),

                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      hintText: 'السعر'
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7,bottom: 7),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Container()),
                                      Expanded(
                                          flex: 3,
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(color:AppColors.YellowColor,width: 4),
                                                    shape: BoxShape.circle
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: AppColors.GreyLightsColor,
                                                  radius: 40,
                                                  child: Text('عيد الفطر',style: TextStyle(fontSize: 11,color: AppColors.blackDarkColor),),

                                                ),
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child: Container()),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7,bottom: 7),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(color:AppColors.PurpleColor,width: 4),
                                                    shape: BoxShape.circle
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: AppColors.GreyLightsColor,
                                                  radius: 40,
                                                  child: Text('اول يوم',style: TextStyle(fontSize: 14,color: AppColors.blackDarkColor),),

                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      hintText: 'السعر'
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                      SizedBox(width: 2,),
                                      Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(color:AppColors.PurpleColor,width: 4),
                                                    shape: BoxShape.circle
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: AppColors.GreyLightsColor,
                                                  radius: 40,
                                                  child: Text('ثانى يوم',style: TextStyle(fontSize: 14,color: AppColors.blackDarkColor),),

                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      hintText: 'السعر'
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                      SizedBox(width: 2,),
                                      Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(color:AppColors.PurpleColor,width: 4),
                                                    shape: BoxShape.circle
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: AppColors.GreyLightsColor,
                                                  radius: 40,
                                                  child: Text('ثالث يوم',style: TextStyle(fontSize: 14,color: AppColors.blackDarkColor),),

                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      hintText: 'السعر'
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                      SizedBox(width: 2,),
                                      Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(color:AppColors.PurpleColor,width: 4),
                                                    shape: BoxShape.circle
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: AppColors.GreyLightsColor,
                                                  radius: 40,
                                                  child: Text('رابع يوم',style: TextStyle(fontSize: 14,color: AppColors.blackDarkColor),),

                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      hintText: 'السعر'
                                                  ),
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

 void _newAccount(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NextNewAccountRooms()));
}
  Future<void> selectDate(BuildContext context, DateTime initialDateTime,
      {DateTime lastDate}) async {
    String format = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
//    print("Date : " +  DateFormat(format).format(DateTime.now()).toString());
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDateTime,
        firstDate: DateTime(1970),
        lastDate: DateTime(2101));
    setState(() {
      // dateAPI = DateFormat(format).format(picked);
      dobContainer.text = picked.toString().substring(0, 10);
      //  print("dateAPI : " +  dateAPI.toString());
//      ZonedDateTime
    });
  }

  Widget itemOfServices(int index) {
    bool selected = index == select ;
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
                  SvgPicture.asset(Resources.SpecialRoomsDetails_LOGO),
                  FittedBox(
                      child: Text(
                        'بلكونة العروس',
                        style: TextStyle(
                            fontSize: 12,
                            color: AppColors.PurpleColor,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )),
          Image(image:AssetImage('assets/images/NO.png')),
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
            decoration: InputDecoration(
              hintText: 'العدد'
            ),
          )
        ],
      ),
    );
  }

}

