import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utils/baseDimentions.dart';
import '../../../utils/base_text_style.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/widgets/transition_image.dart';
import 'ads_widget.dart';

class HomeHeaderWidget extends StatefulWidget {
  const HomeHeaderWidget({Key? key}) : super(key: key);

  @override
  State<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        TransitionImage("assets/images/header_bg.png",
          width: MediaQuery.of(context).size.width,
          height: D.default_170,
          fit: BoxFit.cover,),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(D.default_10),
          height: D.default_170,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(D.default_1),
          ),
          child: Container(
            margin: EdgeInsets.only(bottom: D.default_70,left: D.default_10,right: D.default_10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TransitionImage(
                  "assets/images/avatar.png",
                  width: D.default_50,
                  height: D.default_50,
                  radius: D.default_100,
                  strokeColor: C.RED_1,
                ),
                SizedBox(width: D.default_10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(tr("user name"),style: S.h3(color: C.BLUE_2),),
                  ],)
              ],),),
        ),
        Positioned(child: AdsWidget(),bottom: -D.default_100,)
      ],);
  }
}
