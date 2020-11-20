import 'package:flutter/material.dart';

import '../Colors.dart';
import 'CustomAlertFilter.dart';

class CustomAppBar extends StatelessWidget {
  final String title, text;
  final TextStyle style;
  final IconData filter, icon;
  VoidCallback onPress, onPressFilter;
  appBarAction appAction;

  CustomAppBar(
      {this.title,
      this.style,
      this.icon,
      this.filter,
      this.onPress,
      this.onPressFilter,
      this.text,
      this.appAction = appBarAction.back,});
  String devicesType = 'الكل';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 160,
            color: AppColors.PurpleColor,
          ),
          clipper: CustomClipPath(),
        ),
        ClipPath(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 140,
            color: AppColors.PurpleDarkColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: onPress,
                    child: Icon(
                      icon,
                      color: AppColors.whiteColor,
                      size: 30,
                    )),
                Text(
                  title ?? '',
                  style: style ?? Styles.appbarTextStyle,
                  textScaleFactor: 1,
                ),
                InkWell(
                    onTap: onPressFilter,
                    child: Row(
                      children: [
                        appAction == appBarAction.filter
                            ? Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: AppColors.PurpleColor,
                           ),
                              child: Container(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      icon: Icon(
                                        IconData(
                                          0xF0B0,
                                          fontFamily: 'AppIcon',
                                        ),
                                        color: AppColors.YellowColor,
                                      ),
                                      style: TextStyle(color: AppColors.whiteColor),
                                      value: devicesType,
                                      onChanged: (value) {},
                                      items: [
                                        DropdownMenuItem(
                                          value: 'الكل',
                                          child: Row(
                                            children: <Widget>[Text('الكل')],
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: 'الرياض',
                                          child: Row(
                                            children: <Widget>[Text('الرياض')],
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: 'جدة',
                                          child: Row(
                                            children: <Widget>[Text('جدة')],
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: 'الدمام',
                                          child: Row(
                                            children: <Widget>[Text('الدمام')],
                                          ),
                                        )
                                      ],
                                    ),
                                ),
                              ),
                            )
                                 :   appAction == appBarAction.back ? InkWell(
                          onTap: ()=>Navigator.pop(context),
                              child: Icon(
                                  IconData(
                                    0xE800,
                                    fontFamily: 'AppIcon',
                                  ),
                                  color: AppColors.YellowColor,
                                  size: 20,
                                ),
                            ): Container(),
                      ],
                    )),
              ],
            ),
          ),
          clipper: CustomClipPath(),
        ),
      ],
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipPathTop extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0, size.height / 1.25);
    var firstControlPoint = new Offset(size.width / 4, size.height / 3);
    var firstEndPoint = new Offset(size.width / 2, size.height / 3 - 10);
    var secondControlPoint =
        new Offset(size.width - (size.width / 4), size.height / 4 - 65);
    var secondEndPoint = new Offset(size.width, size.height / 3 - 40);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
