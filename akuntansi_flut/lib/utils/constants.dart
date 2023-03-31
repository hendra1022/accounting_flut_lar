import 'package:google_fonts/google_fonts.dart';

String imagePath = "assets/images/";
String iconPath = "assets/icons/";
const kAnimationDuration = Duration(milliseconds: 200);

class PrefConst {
  static const String keyIsLogin = 'isLogin';
  static const String keyUsername = 'username';
  static const String keyPassword = 'password';

  static const String keyArgsItemId = 'item_id';
  static const String keyArgsCatId = 'cat_id';
  static const String keyArgsCusId = 'cus_id';
  static const String keyArgsSupId = 'sup_id';
}

class SettingsConstants {
  static const String keyIsVideoAutoPlay = "video_auto_play";
}

class TypeChatMessage {
  static const text = "text";
  static const image = "image";
  static const sticker = "sticker";
}

const double mobileSize = 576;
const double webSize = 992;

const double textSizeSuperSmall = 9.0;
const double textSizeSmall = 11.0;
const double textSizeMedium = 13.0;
const double textSizeLarge = 16.0;
const double textSizeExtraLarge = 18.0;
const double textSizeSuperLarge = 21.0;

const double radiusSmall = 8.0;
const double radiusMedium = 10.0;
const double radiusLarge = 12.0;
const double radiusExtraLarge = 16.0;
const double radiusSuperLarge = 20.0;
const double radiusMax = 25.0;

const double paddingSuperSmall = 5.0;
const double paddingSmall = 10.0;
const double paddingMedium = 14.0;
const double paddingLarge = 18.0;
const double paddingExtraLarge = 24.0;

const double marginSuperSmall = 5.0;
const double marginSmall = 10.0;
const double marginMedium = 14.0;
const double marginLarge = 18.0;
const double marginExtraLarge = 24.0;
const double marginViewTop = 30.0;

double imageSizeIcon = 7.0;
double imageSizeBack = 15.0;
double imageSizeSmall = 40.0;
double imageSizeMedium = 50.0;
double imageSizeLarge = 120.0;

double defaultButtonSize = 30.0;

double defaultHeightBackroundPrimary = 195.0;
double defaultHeightContainerCard = 150.0;
double defaultProfileCard = 85.0;
double defaultWidthContainerCard = 335.0;

String defaultCountry = "Indonesia";
String defaultProvince = "Jawa Timur";
String defaultCity = "Surabaya";

String getMessage(String message) => _listMessage[message] ?? "Something Went Wrong";
Map<String, String> _listMessage = {"": ""};

String? interFontFamily = GoogleFonts.inter().fontFamily;
