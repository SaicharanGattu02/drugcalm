import 'package:flutter/material.dart';

import 'CustomSnackBar.dart';

const defaultPadding = 10.0;
const defaultMargin = 10.0;
const defaultHeight = 10.0;
const defaultWidth = 10.0;
const defaultButtonHeight = 50.0;
const defaultRadius = 10.0;
const connectionTimeOut = 60;
double LargeTextSize = 18;
double TextheaderSize = 16;
double TextlabelSize = 12;
double textSize = 12;
double subtextSize = 10;
double minisubtextSize = 8.0;
double XLargeTextSize = 24;

// // var PhonePeMerchantId="NUTSBYONLINE";//Production Key
var PhonePeMerchantId = ""; //PGTESTPAYUAT
// var PhonePeSaltKey="70508497-24ec-4372-bb9f-f7ea4b451f7d";//Production Key
var PhonePeSaltKey = ""; //099eb0cd-02cf-4e2a-8aca-3e6c6aff0399
var PhonePeSaltIndex = "1";
var AppId = "ddeca623b5d548a486c0fcd062479880";
//cce1254412334734990aa88f6a382b4a

// var PhonePeMerchantId="SVINDOONLINE";//production
// var PhonePeSaltKey="78a4f850-4cb2-467d-a5ca-fd8f04420518";//production
// var PhonePeSaltIndex="1";
// var AppId="in.webgrid.svindo";

double screenSpace = 10;

const fontfamilyName = "Ubuntu";
const dreamBikeFont = "nasalization";
const authorization = "Authorization";
const imageQuality = 50;
const dateFormat = "yy/MM/dd";
const timeFormat = "HH:mm:ss";
const sliderHeight = 180.0;
const rupeeSymbol = "₹";
const fav_icon = "assets/images/saveicon.svg";
const mapsApiKey = "AIzaSyCA06NWEP5D-z8WpebENgd4mSOqV-uXIUE";
const upiRegex = "[a-zA-Z0-9.-]{2,256}@[a-zA-Z][a-zA-Z]{2,64}";
const vehicleNumberRegex =
    "^[a-zA-Z]{2}[0-9]{1,2}(?:[a-zA-Z])?(?:[a-zA-Z]*)?[0-9]{4}";
const panNumberRegex = "[A-Z]{5}[0-9]{4}[A-Z]{1}";
const aadhaarRegex = "[0-9]{12}";
const staticImage = "https://picsum.photos/250?image=9";
String chat_socket_url = "wss://192.168.0.56:8000/ws/chat/";
String notify_socket_url = "wss://192.168.0.56:8000/ws/notify/";

String geminiApiKey = "AIzaSyCxSSwFx-2e7d8zrBOCdU23gs7pJv0poO4";

const String NO_INTERNET = "No internet connection.";
const String BAD_RESPONSE = "Received bad response from the server.";
const String SOMETHING_WRONG = "Something went wrong. Please try again.";
const String UNAUTHORIZED = "You are not authorized to access this resource.";

/////////Colors
var notification_val = 0;
// var h = MediaQuery.of(BuildContext contex).size.height;
// var w = MediaQuery.of(BuildContext context).size.width;
// Define your themes
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.white,
  dialogBackgroundColor: Colors.white,
  cardColor: Colors.white,
  searchBarTheme: const SearchBarThemeData(),
  tabBarTheme: const TabBarTheme(),
  dialogTheme: const DialogTheme(
    shadowColor: Colors.white,
    surfaceTintColor: Colors.white,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
          Radius.circular(5.0)), // Set the border radius of the dialog
    ),
  ),
  buttonTheme: const ButtonThemeData(),
  popupMenuTheme:
      const PopupMenuThemeData(color: Colors.white, shadowColor: Colors.white),
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.white,
  ),
  cardTheme: const CardTheme(
    shadowColor: Colors.white,
    surfaceTintColor: Colors.white,
    color: Colors.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.white, backgroundColor: Colors.white),
  // colorScheme: const ColorScheme.light(background: Colors.white)
  //     .copyWith(background: Colors.white),
);

final ThemeData darkTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.white,
  dialogBackgroundColor: Colors.white,
  cardColor: Colors.white,
  searchBarTheme: const SearchBarThemeData(),
  tabBarTheme: const TabBarTheme(),
  dialogTheme: const DialogTheme(
    shadowColor: Colors.white,
    surfaceTintColor: Colors.white,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
          Radius.circular(5.0)), // Set the border radius of the dialog
    ),
  ),
  buttonTheme: const ButtonThemeData(),
  popupMenuTheme:
      const PopupMenuThemeData(color: Colors.white, shadowColor: Colors.white),
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.white,
  ),
  cardTheme: const CardTheme(
    shadowColor: Colors.white,
    surfaceTintColor: Colors.white,
    color: Colors.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.white, backgroundColor: Colors.white),
);

///Colors ..................................................................................................

LinearGradient lineargradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF22C6BF),
    Color(0xFF04B4AC),
  ],
);

Text text(
  BuildContext context,
  String textContent,
  double fontsize, {
  TextOverflow? overflow,
  String? fontfamily,
  Color? color,
  int? maxLines,
  Color? decorationcolor,
  TextDecoration? textdecoration,
  FontWeight fontWeight = FontWeight.w600,
  TextAlign textAlign = TextAlign.center,
}) {
  if (color == null) {
    final theme = Theme.of(context);
    color = theme.brightness == Brightness.dark
        ? Colors.white
        : const Color(0xff161531);
  }

  return Text(
    textContent,
    maxLines: maxLines,
    style: TextStyle(
      color: color,
      fontSize: fontsize,
      fontWeight: fontWeight,
      decoration: textdecoration,
      decorationColor: decorationcolor,
      overflow: overflow,
      fontFamily:
          fontfamily ?? "Inter", // Ensure the font is added in pubspec.yaml
    ),
    textAlign: textAlign,
  );
}

Color getColorFromGradient(double t) {
  // Ensure t is between 0 and 1 to interpolate between the two colors
  t = t.clamp(0.0, 1.0);
  int r = (linearGradient.colors[0].red +
          t * (linearGradient.colors[1].red - linearGradient.colors[0].red))
      .round();
  int g = (linearGradient.colors[0].green +
          t * (linearGradient.colors[1].green - linearGradient.colors[0].green))
      .round();
  int b = (linearGradient.colors[0].blue +
          t * (linearGradient.colors[1].blue - linearGradient.colors[0].blue))
      .round();

  return Color.fromARGB(255, r, g, b);
}

Color color = Color(0xff617C9D);

Color color1 = getColorFromGradient(0.5);
Color color2 = Color(0xff617C9D);
Color color3 = Color(0xffCDE2FB);
Color color4 = Color(0xffffffff);
Color color5 = Color(0xff01A744);
Color color6 = Color(0xffFC4B6F);
Color color7 = Color(0xffA5BECC);
Color color8 = Color(0xff7E7E7E);
Color color9 = Color(0xffDAEAF6);
Color color10 = Color(0xff8E8D8D);
Color color11 = Color(0xff000000);
Color color12 = Color(0xffECF2F6);
Color color13 = Color(0xff34C759);
Color color14 = Color(0xffFEF6F5);
Color color15 = Color(0xffD6E2F0);
Color color16 = Color(0xffFF3B30);
Color color17 = Color(0xffD1D8DD);
Color color18 = Color(0xff161531);
Color color19 = Color(0xff0C2638);
Color color20 = Color(0xff576B80);
Color color21 = Color(0xffE3FDFC);
Color color22 = Color(0xffE1F4FF);
Color color23 = Color(0xff242A37);
Color color24 = Color(0xff22C6BF);
Color color25 = Color(0xff262422);
Color color26 = Color(0xffABABAB);
Color color27 = Color(0xffEFF4F8);
final spinkits=Spinkits();

Widget containertext(BuildContext context, String buttonText,
    {Function()? onTap, double? width, height, bool isLoading = false}) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;

  return InkResponse(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF22C6BF), Color(0xFF04B4AC)],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading?spinkits.getFadingCircleSpinner(color: color4):
          Text(
                  buttonText,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    height: 21.78 / 18,
                    letterSpacing: 1,
                    fontFamily: "Inter",
                  ),
                ),
        ),
      ));
}

Widget containertext1(BuildContext context, String buttonText,
    {Function()? onTap, double? width, height}) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;

  return InkResponse(
    onTap: onTap,
    child: Container(
      height: 40,
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF22C6BF), Color(0xFF04B4AC)],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.w500,
              fontSize: 13,
              height: 21.78 / 18,
              letterSpacing: 1,
              fontFamily: "Inter"),
        ),
      ),
    ),
  );
}

LinearGradient linearGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF22C6BF),
    Color(0xFF04B4AC),
  ],
);

Container container(BuildContext context,
    {required Widget child,
    BorderRadius? borderRadius,
    double? w,
    h,
    Border? border,
    Color? colors,
    EdgeInsets? padding,
    EdgeInsets? margin}) {
  return Container(
    width: w,
    height: h,
    padding: padding ?? EdgeInsets.all(16),
    margin: margin,
    decoration: BoxDecoration(
        color: colors,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        border: border),
    child: child,
  );
}





Widget Label({
  required String text,
  TextAlign? textalign
}) {
  return Text(text,
      textAlign: textalign,
      style: TextStyle(
          color: Color(0xff110B0F),
          fontFamily: 'RozhaOne',
          fontSize: 15,
          height: 21.3/ 15,
          fontWeight: FontWeight.w400)
  );
}

class DateTimeFormatter {
  // Method to format both date and time based on user choice
  static String format(String isoDate,
      {bool includeDate = true, bool includeTime = false}) {
    if (isoDate.isEmpty) {
      return "";
    }

    try {
      // Remove AM/PM if present to avoid parsing issues
      String cleanedDate = isoDate.replaceAll(RegExp(r'(AM|PM)'), '').trim();

      // Parse the date
      DateTime dateTime = DateTime.parse(cleanedDate);

      // Format the date and time as needed
      String formattedDate = "";
      if (includeDate) {
        formattedDate =
        "${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
      }

      String formattedTime = "";
      if (includeTime) {
        formattedTime =
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
      }

      // Combine date and time if both are requested
      if (includeDate && includeTime) {
        return "$formattedDate $formattedTime";
      } else if (includeDate) {
        return formattedDate;
      } else if (includeTime) {
        return formattedTime;
      }
    } catch (e) {
      print("Error parsing date: $e");
      return "";
    }

    return "";
  }
}


class RatingWidget extends StatefulWidget {
  final double initialRating;

  RatingWidget({
    Key? key,
    this.initialRating = 0.0,
  }) : super(key: key);

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  late double _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        return Icon(
          _currentRating > index
              ? Icons.star
              : Icons.star_border, // Filled star or empty star
          color: Color(0xffEA7204),
          size: 18,
        );
      }),
    );
  }
}
