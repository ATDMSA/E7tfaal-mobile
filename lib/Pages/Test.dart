import 'package:celebration/Component/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:photo_view/photo_view.dart';


class ImageScreen extends StatefulWidget {
  final String images;
  ImageScreen(this.images,);

  @override
  _MyImageScreen createState() => _MyImageScreen();
}

class _MyImageScreen extends State<ImageScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar:  appBar() ,
        body: imageBuilder());
  }

  Widget appBar() {


    return AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back,color: AppColors.whiteColor,size: 25,),
          ),
          onTap: () => Navigator.pop(context, true),
        )
    );

  }


  Widget imageBuilder() {
    return Builder(builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * .75,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return PhotoView(
                      imageProvider: AssetImage(widget.images),
                    );
                  },
                  itemCount: 6,
                  autoplay: false,

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
            ],
          )
        ],
      );
    });
  }
}
