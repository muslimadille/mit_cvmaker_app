import 'package:flutter/material.dart';

import '../../../utils/baseDimentions.dart';
import '../../../utils/base_text_style.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/widgets/transition_image.dart';

class TemplateItemWidget extends StatefulWidget {
  const TemplateItemWidget({Key? key}) : super(key: key);

  @override
  State<TemplateItemWidget> createState() => _TemplateItemWidgetState();
}

class _TemplateItemWidgetState extends State<TemplateItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.all(D.default_10),
        width: D.default_150,
        height: D.default_200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(D.default_10),
            color: Colors.white,
            boxShadow:[BoxShadow(
                color: C.BLUE_1.withOpacity(0.3),
                offset:Offset(1,1),
                blurRadius:5,
                spreadRadius: 1
            )]
        ),
        child: Stack(
          children: [

            Container(
              margin: EdgeInsets.all(D.default_10),
              child:Column(children: [
                _image(),
                _description(),

              ],),
            ),
          ],
        ),
      ),
    );
  }
  Widget _image(){
    return TransitionImage(
      "assets/images/template.png",
      height: D.default_200,
      width: double.infinity,
      fit: BoxFit.cover,

    );
  }
  Widget _description(){
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top:D.default_10),
        child: Text("",style: S.h4(color: C.GREY_3),),),
    );
  }
}
