import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Component/Widget/EduButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'NextAccountRooms.dart';

class NewAccountRooms extends StatefulWidget {
  final String name;
  NewAccountRooms({this.name});
  @override
  _NewAccountRoomsState createState() => _NewAccountRoomsState();
}

class _NewAccountRoomsState extends State<NewAccountRooms> {


  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  Location _location = Location();

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

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
                  title: widget.name,
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
                        Container(
                          height: MediaQuery.of(context).size.height * .4,
                          width: MediaQuery.of(context).size.width ,
                          child: Stack(
                            children: [
                              GoogleMap(
                                initialCameraPosition: CameraPosition(target: _initialcameraposition),
                                mapType: MapType.normal,
                                onMapCreated: _onMapCreated,
                                myLocationEnabled: true,
                              ),
                            ],
                          ),
                        ),

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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NextAccountRooms()));
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

}

