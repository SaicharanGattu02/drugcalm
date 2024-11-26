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
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: color1,
      leading:Container(),
      leadingWidth: 0,

      title:Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(children: [ InkResponse(
          onTap: () {
            Navigator.pop(context, true);
          },
          child: Row(
            children: [
              Icon(Icons.arrow_back, color: Color(0xffffffff)),
              const SizedBox(width: 12),
            ],
          ),
        ),

          Text(
            title,
            style: TextStyle(
              color: Color(0xffffffff),
              fontFamily: 'RozhaOne',
              fontSize: 24,
              height: 32 / 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
        ),
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
              SizedBox(
                width: w * 0.02,
              ),
              InkWell(
                onTap: onPlusTap ?? () {},
                child: Image.asset(
                  "assets/notifications.png",
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: w * 0.02,
              ),
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
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
