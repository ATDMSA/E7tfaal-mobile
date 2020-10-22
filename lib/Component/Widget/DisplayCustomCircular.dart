import 'package:flutter/material.dart';

import 'CustomCircularLoad.dart';

displayCustomCircular(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return new CircularLoad();
      }));
}

closeCustomCircular(BuildContext context) {
  Navigator.of(context).pop();
}