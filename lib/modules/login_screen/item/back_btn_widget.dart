import 'package:flutter/material.dart';
import '../../../utils/baseDimentions.dart';
import '../../../utils/my_colors.dart';

class BackBottonWidget extends StatelessWidget {
  BuildContext ctx;
  Color? color;
   BackBottonWidget(this.ctx,{this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed:(){
      Navigator.of(ctx).pop();
    }, icon: Icon(Icons.arrow_back_ios,color: color??C.GREY_1,size: D.default_30,));
  }
}
