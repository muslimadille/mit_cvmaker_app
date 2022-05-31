import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utils/baseDimentions.dart';
import '../../../utils/base_text_style.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/widgets/base_botton.dart';

class AdsWidget extends StatefulWidget {
  const AdsWidget({Key? key}) : super(key: key);

  @override
  State<AdsWidget> createState() => _AdsWidgetState();
}

class _AdsWidgetState extends State<AdsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: D.default_170,
      width: MediaQuery.of(context).size.width-D.default_30,
      margin: EdgeInsets.all(D.default_10),
      padding: EdgeInsets.all(D.default_15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_10),
          color:Colors.white,
          boxShadow: [BoxShadow(
              color: C.BLUE_1.withOpacity(0.3),
              offset:Offset(0,0),
              blurRadius:3,
              spreadRadius: 3
          )]
      ),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tr("welcome_text"),style: S.h1(color: C.BLUE_1),),
            Expanded(child:Text(tr("Create your very own professional Resume and download it\nwithin 15 minutes"),style: S.h4(color: C.GREY_3),),),
            SizedBox(height: D.default_10,),
            _createCVButton()
          ],)],

      ),
    );
  }
  Widget _createCVButton(){
    return BaseButton(
      onItemClickListener: (){
        // MyUtils.navigate(context, MainTabsScreen());
      },
      title: tr("Create Your Resume"),
      color: C.BLUE_1,
      textStyle: S.h4(color: Colors.white),
      width: D.default_150,
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(D.default_2),
      height: D.default_40,
      enableShadow: true,
    );
  }
}
