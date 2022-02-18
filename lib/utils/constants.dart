import 'dart:ui';

var pixelRatio = window.devicePixelRatio;

//Size in physical pixels
var physicalScreenSize = window.physicalSize;
var physicalWidth = physicalScreenSize.width;
var physicalHeight = physicalScreenSize.height;

//Size in logical pixels
var logicalScreenSize = window.physicalSize / pixelRatio;
var logicalWidth = logicalScreenSize.width;
var logicalHeight = logicalScreenSize.height;

//Padding in physical pixels
var padding = window.padding;

//Safe area paddings in logical pixels
var paddingLeft = window.padding.left / window.devicePixelRatio;
var paddingRight = window.padding.right / window.devicePixelRatio;
var paddingTop = window.padding.top / window.devicePixelRatio;
var paddingBottom = window.padding.bottom / window.devicePixelRatio;

//Safe area in logical pixels
var safeWidth = logicalWidth - paddingLeft - paddingRight;
var safeHeight = logicalHeight - paddingTop - paddingBottom;

class AppMargin {
  static double vertical = logicalHeight / 64;
  static double horizontal = logicalWidth / 45;
}

class AppDimensions {
  static double height0p5 = logicalHeight / 1280; //0.5
  static double height1p2 = logicalHeight / 533.3333334; //1.2
  static double height3 = logicalHeight / 160; //3
  static double height6 = logicalHeight / 106.7; //6
  static double height10 = logicalHeight / 64; //10
  static double height11 = logicalHeight / 58.1818182; //11
  static double height12 = logicalHeight / 53.333334; //12
  static double height15 = logicalHeight / 42.66667; //15
  static double height16 = logicalHeight / 40; //16
  static double height18 = logicalHeight / 35.5555556; //18
  static double height20 = logicalHeight / 32; //20
  static double height22 = logicalHeight / 29.09091; //22
  static double height24 = logicalHeight / 26.77; //24
  static double height28 = logicalHeight / 22.857143; //28
  static double height32 = logicalHeight / 20; //32
  static double height38 = logicalHeight / 16.8422; //38
  static double height40 = logicalHeight / 16; //40
  static double height48 = logicalHeight / 13.333334; //48
  static double height52 = logicalHeight / 12.307; //52
  static double height80 = logicalHeight / 8; //80
  static double height100 = logicalHeight / 6.4; //100
  //----------------------width---------------------------//
  static double width3 = logicalWidth / 120; //3
  static double width4 = logicalWidth / 90; //4
  static double width6 = logicalWidth / 60; //6
  static double width10 = logicalWidth / 36; //10
  static double width11 = logicalWidth / 32.727273; //11
  static double width16 = logicalWidth / 22.5; //16
  static double width20 = logicalWidth / 32; //20
  static double width24 = logicalWidth / 18; //24
  static double width32 = logicalWidth / 11.25; //32
  static double width40 = logicalWidth / 9; //40
  static double width44 = logicalWidth / 8.181819; //44
  static double width48 = logicalWidth / 7.5; //48
  static double width52 = logicalWidth / 6.92308; //52
  static double width88 = logicalWidth / 4.1; //88
  static double width100 = logicalWidth / 3.6; //100
}
