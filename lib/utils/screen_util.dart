import 'package:flutter_screenutil/flutter_screenutil.dart' as util;
import 'package:flutter/material.dart';

mixin ScreenUtil {
  initScreenUtil(BuildContext context, {int width = 1080, int height = 1920, bool allowFontScaling = false}) {
    util.ScreenUtil.instance = util.ScreenUtil(width: width.toDouble(), height: height.toDouble(), allowFontScaling: allowFontScaling)..init(context);
  }

  setHeight(int height) {
    return util.ScreenUtil.getInstance().setHeight(height.toDouble());
  }

  setWidth(int width) {
    return util.ScreenUtil.getInstance().setWidth(width.toDouble());
  }

  setSp(int fontSize) {
    return util.ScreenUtil.getInstance().setSp(fontSize.toDouble());
  }

  ///当前设备高度 dp
  double get screenHeightDp => util.ScreenUtil.screenHeightDp;

  double get screenWidthDp => util.ScreenUtil.screenWidthDp;

  ///当前设备宽度 px
  double get screenWidth => util.ScreenUtil.screenWidth;

  ///当前设备高度 px
  double get screenHeight => util.ScreenUtil.screenHeight;

  ///状态栏高度 刘海屏会更高
  int  get statusBarHeight => util.ScreenUtil.statusBarHeight.toInt();

  ///底部安全区距离
  double get bottomBarHeight => util.ScreenUtil.bottomBarHeight;

  ///实际的dp与设计稿px的比例
  get scaleWidth => util.ScreenUtil.getInstance().scaleWidth;

  get scaleHeight => util.ScreenUtil.getInstance().scaleHeight;

}