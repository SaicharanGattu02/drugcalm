import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final VoidCallback? onPlusTap;

  const CustomAppBar1({
    Key? key,
    required this.title,
    required this.actions,
    this.onPlusTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    return AppBar(backgroundColor: color1,
        title:Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: color4,
              ),
            ),
            SizedBox(width: 10,),
            text(context,title, 20,color: color4),
          ],
        ),
      actions: actions.isNotEmpty
          ? actions
          : [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              InkWell(
                onTap: onPlusTap ?? () {},
                child: Image.asset(
                  "assets/search.png",
                  width: 18,
                  height: 18,
                  color: color4,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: w*0.02,),
              InkWell(
                onTap: onPlusTap ?? () {},
                child: Image.asset(
                  "assets/notifications.png",
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: w*0.02,),
              InkWell(
                onTap: onPlusTap ?? () {},
                child: Image.asset(
                  "assets/cart.png",
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),

        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
