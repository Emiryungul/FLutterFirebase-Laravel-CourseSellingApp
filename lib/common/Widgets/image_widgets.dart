import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/image_res.dart';

Widget appImage(
    {String imagePath = "",
      double width = 16,
      double height = 16}) {
  return Image.asset(
    imagePath.isEmpty ? ImageRes.gridImage : imagePath,
    width: width.w,
    height: height.h,
  );
}
