
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets/transition_image.dart';
import '../base_screen/base_screen.dart';
import '../home/elements/reamplet_item_widget.dart';
import '../login_screen/item/back_btn_widget.dart';

class TemplatesScreen extends StatefulWidget {

  TemplatesScreen() ;

  @override
  State<TemplatesScreen> createState() => _TemplatesScreenState();
}

class _TemplatesScreenState extends State<TemplatesScreen> {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return BaseScreen(body: SafeArea(child:
    Stack(children: [
      Container(
        child: Column(children:  [
          _header(context),
          SizedBox(height: D.default_10,),
          Expanded(child: templatesList())

        ],),
      ),
      //searchProvider!.isLoading?LoadingProgress():Container()
    ],),));
  }

  Widget _header(BuildContext ctx){
    return Container(
      height: D.default_80,
      child: Stack(children: [
        TransitionImage("assets/images/header_bg.png",
          width: MediaQuery.of(context).size.width,
          height: D.default_80,
          fit: BoxFit.fill,),
        Container(
          padding: EdgeInsets.only(top:D.default_20,left:D.default_30,right:D.default_30),
          child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: Text(tr("templates"),style: S.h1(color: Colors.white),textAlign: TextAlign.center,)),
              ],),
          ],
        ),)
      ],),);

  }

  Widget templatesList(){
    return Container(
      margin: EdgeInsets.only(left: D.default_20,right: D.default_20),
      child: CustomScrollView(slivers: [
        SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: D.default_10,
              mainAxisSpacing: D.default_10,
              childAspectRatio: D.default_1*0.9,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                GlobalKey key=GlobalKey();
                return TemplateItemWidget();
              },
              childCount: 10,
              semanticIndexOffset: 1,
            )),

      ]),);
  }

}


