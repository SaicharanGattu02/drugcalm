
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({
    super.key,
    this.onpressed,
  });
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onpressed,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "assets/Why Insurance.png",
              fit: BoxFit.contain,
            ),
          )),
    );
  }
}

class BannerImage1 extends StatelessWidget {
  const BannerImage1({
    super.key,
    this.onpressed,
  });
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onpressed,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "assets/ad.png",
              fit: BoxFit.contain,
            ),
          )),
    );
  }
}
