import 'package:drugcalm/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  // final List<Widget> actions;
  final VoidCallback? onPlusTap;  // Callback for handling the Plus square tap

  const CustomAppBar({
    Key? key,
    required this.title,
    // required this.actions,
    this.onPlusTap, // Optional callback for navigation or any other action
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Container(),
      leadingWidth: 10,
      title:
      Row(
        children: [
          // InkWell(
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          //   child: const Icon(
          //     Icons.arrow_back,
          //     // color: Color(0xffffffff),
          //   ),
          // ),
          SizedBox(width: 15,),
          text(context,title, 18,fontWeight: FontWeight.w700),
        ],
      )


    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
