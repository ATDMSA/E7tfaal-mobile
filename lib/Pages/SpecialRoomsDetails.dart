import 'package:celebration/Component/Colors.dart';
import 'package:celebration/Component/LocalKeys.dart';
import 'package:celebration/Component/Resources.dart';
import 'package:celebration/Component/Widget/CustomAlertDialog.dart';
import 'package:celebration/Component/Widget/CustomAppBar.dart';
import 'package:celebration/Component/Widget/EduButton.dart';
import 'package:celebration/Pages/Drawers/Drawer.dart';
import 'package:celebration/Pages/RatingsPage.dart';
import 'Test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'SpecialRooms.dart';

class SpecialRoomsDetails extends StatefulWidget {
  @override
  _SpecialRoomsDetailsState createState() => _SpecialRoomsDetailsState();
}

class _SpecialRoomsDetailsState extends State<SpecialRoomsDetails> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  bool selected  =false;
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  Location _location = Location();
  TextEditingController dobContainer = new TextEditingController();
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



  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: ' حمل تطبيق احتفال الان',
        //linkUrl: 'https://celebration.app/',
        chooserTitle: 'Select App ..');
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: AppDrawer(),
      body:  ListView(
        padding: EdgeInsets.zero,
        children: [
          // appbar
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0.0),
                      child: SizedBox(
                        height: 300.0,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return new Image.asset(
                              Resources.SpecialRoomsDetails,
                              fit: BoxFit.fill,
                            );
                          },
                          itemCount: 6,
                          autoplay: true,
                          onTap: (int i){
                            print('ffffffffffffff');
                            print(i.toString());
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageScreen(Resources.SpecialRoomsDetails,)));
                          },
                          pagination: new SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: new DotSwiperPaginationBuilder(
                                  color: Color(0xffD8D8D8),
                                  activeColor: Color(0xff707070))),
                          control: new SwiperControl(
                            color: Colors.white.withOpacity(.7),
                            disableColor: AppColors.YellowColor,
                            iconNext: IconData(
                              0xE803,
                              fontFamily: 'AppIcon',
                            ),
                            iconPrevious: IconData(
                              0xE806,
                              fontFamily: 'AppIcon',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  share();
                                },
                                child: Icon(
                                  Icons.share,
                                  color: AppColors.whiteColor,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    selected = !selected;
                                    print('selected value');
                                    print(selected);
                                  });
                                },
                                   child: selected ==false ? Icon(
                                  Icons.favorite_border,
                                  color: AppColors.YellowColor,
                                  size: 30,
                                ) :Icon(
                                     Icons.favorite,
                                     color: AppColors.YellowColor,
                                     size: 30,
                                   ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                            Resources.SpecialRoomsDetails_LOGO),
                      ],
                    )
                  ],
                ),
              ),
              CustomAppBar(
                onPress: () => _drawerKey.currentState.openDrawer(),
                icon: IconData(
                  0xE802,
                  fontFamily: 'AppIcon',
                ),
                title: LocalKeys.SpecialRoomsDetails,
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>RatingsPage())),
                                child: Text(
                                  'تعليقات الزوار',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                      color: AppColors.PurpleColor),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'قاعة مميزة',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.PurpleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColors.PurpleColor,
                                      size: 15,
                                    ),
                                    Text(
                                      'حى الرحمانية بجوار البيك - جدة',
                                      style: TextStyle(
                                          color: AppColors.PurpleColor,
                                          fontSize: 9),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.YellowColor,
                                          width: 4),
                                      shape: BoxShape.circle),
                                  child: Image(
                                      image: AssetImage(Resources
                                          .SpecialRoomsDetails_MARK))),

                              CircleAvatar(
                                backgroundColor: AppColors.YellowColor,
                                  child: Icon(Icons.check,size: 40,color: AppColors.whiteColor,)),
                             // Image(image: AssetImage('assets/images/مميز.png'))
                            ],
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'يبدأ من',
                                        style: TextStyle(
                                            color: AppColors.PurpleColor,
                                            fontSize: 10,
                                            decoration:
                                            TextDecoration.underline),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'SAR',
                                        style: TextStyle(
                                            color: AppColors.PurpleColor,
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '500',
                                    style: TextStyle(
                                        color: AppColors.PurpleColor,
                                        fontSize: 31,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'خصم',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.YellowColor,
                                        fontSize: 10,
                                        decoration:
                                        TextDecoration.underline),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '50',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.YellowColor,
                                        fontSize: 17,
                                       ),
                                  ),
                                  SvgPicture.asset(
                                      'assets/images/hot-sale.svg'
                                  )
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'قاعة الأسطورة',
                    style: TextStyle(
                        fontSize: 29,
                        color: AppColors.PurpleColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_half,
                        color: AppColors.PurpleColor,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.PurpleColor,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.PurpleColor,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.PurpleColor,
                        size: 18,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.PurpleColor,
                        size: 18,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(
                            fontSize: 17,
                            color: AppColors.PurpleColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: AppColors.PurpleColor,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'آخر تحديث منذ 21 دقيقه',
                  style: TextStyle(
                      color: AppColors.PurpleColor, fontSize: 9),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                    childAspectRatio: 1.0,
                    crossAxisCount: 3,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(8, (index) {
                      return itemOfServices();
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
                          LocalKeys.SpecialRoomsADDRESS,
                          style: TextStyle(
                              fontSize: 17,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        addressServices(
                            title: 'أسم الشارع', value: 'شارع فلسطين'),
                        addressServices(
                            title: 'اسم معلم إضافي',
                            value: 'بجوار  مطعم البيك'),
                        addressServices(
                            title: 'أسم المدنية ', value: 'مكة المكرمة'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 5,
                                child: addressServices(
                                    title: 'الدولة ',
                                    value: 'المملكة العربية السعودية')),
                            Expanded(
                                flex: 5,
                                child: addressServices(
                                    title: 'المنطقة',
                                    value: 'مكة المكرمة')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                  myLocationEnabled: false,
                  zoomControlsEnabled: false,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
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
                          /*Divider(
                                  color: AppColors.GreyLightColor,
                                  height: 2,
                                  thickness: 1.1,
                                )*/
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
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
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
                    padding: const EdgeInsets.only(top: 7),
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
                                SizedBox(height: 10,),
                                Text('SR 100,000',style: TextStyle(fontSize: 11),)
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
                                SizedBox(height: 10,),
                                Text('100,000 SR',style: TextStyle(fontSize: 11),)
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
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
                                SizedBox(height: 10,),
                                Text('SR 100,000',style: TextStyle(fontSize: 11),)
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
                                SizedBox(height: 10,),
                                Text('100,000 SR',style: TextStyle(fontSize: 11),)
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
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
                    padding: const EdgeInsets.only(top: 7),
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
                                SizedBox(height: 10,),
                                Text('SR 100,000',style: TextStyle(fontSize: 11),)
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
                                SizedBox(height: 10,),
                                Text('SR 100,000',style: TextStyle(fontSize: 11),)
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
                                SizedBox(height: 10,),
                                Text('100,000 SR',style: TextStyle(fontSize: 11),)
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
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
                    padding: const EdgeInsets.only(top: 7),
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
                                SizedBox(height: 10,),
                                Text('SR 100,000',style: TextStyle(fontSize: 11),)
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
                                SizedBox(height: 10,),
                                Text('SR 100,000',style: TextStyle(fontSize: 11),)
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
                                SizedBox(height: 10,),
                                Text('100,000 SR',style: TextStyle(fontSize: 11),)
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
                                SizedBox(height: 10,),
                                Text('100,000 SR',style: TextStyle(fontSize: 11),)
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: EduButton(
              title: LocalKeys.SpecialRoomsReservation,
              onPressed: _navigateToLogin,
              bgColor: AppColors.YellowColor,
              cornerRadius: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget itemOfServices() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
    );
  }

  Widget addressServices({String title, String value}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              title,
              style: TextStyle(fontSize: 14, color: AppColors.GreyColor),
            ),
          ),
          FittedBox(
            child: Text(
              value,
              style: TextStyle(fontSize: 15, color: AppColors.blackDarkColor),
            ),
          ),
          Divider(
            color: AppColors.GreyLightColor,
            height: 2,
            thickness: 1.1,
          )
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
          FittedBox(
            child: Text(
              value.toString(),
              style: TextStyle(fontSize: 12, color: AppColors.PurpleColor),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToLogin() {
    selectDate(context, DateTime.now());
  }
  Future<void> selectDate(BuildContext context, DateTime initialDateTime,
      {DateTime lastDate}) async {
    String format = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
//    print("Date : " +  DateFormat(format).format(DateTime.now()).toString());
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDateTime,
        firstDate: DateTime(2020),
        lastDate: DateTime(2100));
    setState(() {
      showDialog(
        context: context,
        builder: (_) => CustomAlertDialog(
          mess:  'موعد مرفوض يرجى حجز موعد اخر'
        ),
      );
      dobContainer.text = picked.toString().substring(0, 10);
      // dateAPI = DateFormat(format).format(picked);
      //  print("dateAPI : " +  dateAPI.toString());
//      ZonedDateTime
    });
  }
}
