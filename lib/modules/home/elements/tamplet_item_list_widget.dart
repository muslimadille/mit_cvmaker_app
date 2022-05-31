import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mit_cvmaker_app/modules/home/elements/reamplet_item_widget.dart';
import 'package:mit_cvmaker_app/utils/my_utils.dart';

import '../../../utils/baseDimentions.dart';
import '../../../utils/base_text_style.dart';
import '../../../utils/my_colors.dart';
import '../../tempelates/templates_screen.dart';

class TemplateItemListWidget extends StatefulWidget {
  String title;
  String buttonName;
   TemplateItemListWidget(this.title,this.buttonName,{Key? key}) : super(key: key);

  @override
  State<TemplateItemListWidget> createState() => _TemplateItemListWidgetState();
}

class _TemplateItemListWidgetState extends State<TemplateItemListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: D.default_10),
      width: MediaQuery.of(context).size.width,
      height: D.default_300*0.9,
      child: Column(children: [
        Container(
          child: Row(children: [
            _title(),
            Expanded(child: Container()),
            _seeAll(context)
          ],),),
        Expanded(child: ListView.builder(
          itemBuilder: (context,index){
            return TemplateItemWidget();
          },
          itemCount:3,
          scrollDirection: Axis.horizontal,
        ),)
      ],),
    );
  }
  Widget _title(){
    return Container(
      margin: EdgeInsets.only(left: D.default_20,right: D.default_20),
      child: Text(widget.title,style: S.h3(color: C.GREY_1),),
    );
  }
  Widget _seeAll(BuildContext context){
    return InkWell(onTap: (){
      MyUtils.navigate(context, TemplatesScreen());
    },child: Container(
      margin: EdgeInsets.only(left: D.default_20,right: D.default_20),
      child:Text( widget.buttonName,style: S.h3(color: C.BLUE_1,underline: true),),
    ),);
  }
}
