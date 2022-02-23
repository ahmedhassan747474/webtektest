import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

int helpI = 0;
double helpLatitude = 0;
double helpLongitude = 0;
// List<Address> addresses;
int helpHero() {
  return helpI++;
}

String helpLanguage = 'ar';
void helpNavigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

helpClipAppBar() {
  return Positioned(
    top: -100,
    left: -100,
    right: -100,
    child: ClipOval(
      child: Container(height: 300.0, width: double.infinity),
    ),
  );
}

Widget helpImage(String image, double radius, {double height, double width}) {
  return CachedNetworkImage(
    imageUrl: "$image",
    fit: BoxFit.contain,
    height: height,
    width: width ?? double.infinity,
    imageBuilder: (ctx, image) {
      return Container(
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
      );
    },
    placeholder: (_, __) => Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFFE31220),
        ),
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Icon(Icons.file_download),
        )),
    errorWidget: (context, url, error) => Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFFE31220),
        ),
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: const Icon(Icons.file_download),
        )),
  );
}

Widget helpImageFatora(String image, double radius) {
  return CachedNetworkImage(
    imageUrl: "$image",
    fit: BoxFit.contain,
    imageBuilder: (ctx, image) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: image,
            fit: BoxFit.fill,
          ),
        ),
      );
    },
    placeholder: (_, __) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFFE31220),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
          ),
        )),
    errorWidget: (context, url, error) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFFE31220),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
          ),
        )),
  );
}

Widget helpClip(double radius, Widget widget) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: widget,
  );
}

Widget backgroundImage(double width) {
  return Container(
    height: 300.0,
    width: width,
    child: Stack(
      alignment: AlignmentDirectional.topStart,
      children: <Widget>[
        Positioned(
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/properse.png",
              fit: BoxFit.fill,
            ),
          ),
          top: -50,
        ),
      ],
    ),
  );
}
