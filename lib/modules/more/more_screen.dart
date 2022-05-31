
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets/transition_image.dart';
import '../base_screen/base_screen.dart';
import '../home/elements/reamplet_item_widget.dart';

class MoreScreen extends StatefulWidget {

  MoreScreen() ;

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {

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
          Expanded(child: SingleChildScrollView(child: Column(children: [
            _pricing(),
            _aboutUs(),
            _terms(),
            _changeLanguage(),
            _logout()
          ],),))

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
                  Expanded(child: Text(tr("more"),style: S.h1(color: Colors.white),textAlign: TextAlign.center,)),
                ],),
            ],
          ),)
      ],),);

  }
  Widget _changeLanguage(){
    return Container(
      height: D.default_70,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(D.default_10),
      padding: EdgeInsets.all(D.default_10),
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(D.default_10),
            color: Colors.white,
            boxShadow: [BoxShadow(
                color: C.BLUE_1.withOpacity(0.1),
                offset:Offset(1,1),
                blurRadius:2,
                spreadRadius: 2
            )]
        ),
      child: InkWell(
        onTap:(){
        
      },
        child: Row(children: [
          Icon(Icons.language,size: D.default_25,color: C.BLUE_1,),
          Container(height: MediaQuery.of(context).size.height,color: C.RED_1,width: D.default_1,margin: EdgeInsets.only(top:D.default_5,bottom: D.default_5,left: D.default_10,right: D.default_10),),
          Expanded(child: Text(tr("change_lang"),style:S.h4(color: C.GREY_1) ,)),
          Icon(Localizations.localeOf(context)==Locale('en', 'US')?Icons.arrow_forward_ios:Icons.arrow_back_ios,size: D.default_25,color: C.BLUE_1,),

        ],),),
    );
  }
  Widget _aboutUs(){
    return Container(
      height: D.default_70,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(D.default_10),
      padding: EdgeInsets.all(D.default_10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_10),
          color: Colors.white,
          boxShadow: [BoxShadow(
              color: C.BLUE_1.withOpacity(0.1),
              offset:Offset(1,1),
              blurRadius:2,
              spreadRadius: 2
          )]
      ),
      child: InkWell(
        onTap:(){

        },
        child: Row(children: [
          Icon(Icons.language,size: D.default_25,color: C.BLUE_1,),
          Container(height: MediaQuery.of(context).size.height,color: C.RED_1,width: D.default_1,margin: EdgeInsets.only(top:D.default_5,bottom: D.default_5,left: D.default_10,right: D.default_10),),
          Expanded(child: Text(tr("about_us"),style:S.h4(color: C.GREY_1) ,)),
          Icon(Localizations.localeOf(context)==Locale('en', 'US')?Icons.arrow_forward_ios:Icons.arrow_back_ios,size: D.default_25,color: C.BLUE_1,),

        ],),),
    );
  }
  Widget _terms(){
    return Container(
      height: D.default_70,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(D.default_10),
      padding: EdgeInsets.all(D.default_10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_10),
          color: Colors.white,
          boxShadow: [BoxShadow(
              color: C.BLUE_1.withOpacity(0.1),
              offset:Offset(1,1),
              blurRadius:2,
              spreadRadius: 2
          )]
      ),
      child: InkWell(
        onTap:(){

        },
        child: Row(children: [
          Icon(Icons.language,size: D.default_25,color: C.BLUE_1,),
          Container(height: MediaQuery.of(context).size.height,color: C.RED_1,width: D.default_1,margin: EdgeInsets.only(top:D.default_5,bottom: D.default_5,left: D.default_10,right: D.default_10),),
          Expanded(child: Text(tr("terms"),style:S.h4(color: C.GREY_1) ,)),
          Icon(Localizations.localeOf(context)==Locale('en', 'US')?Icons.arrow_forward_ios:Icons.arrow_back_ios,size: D.default_25,color: C.BLUE_1,),

        ],),),
    );
  }
  Widget _pricing(){
    return Container(
      height: D.default_70,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(D.default_10),
      padding: EdgeInsets.all(D.default_10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_10),
          color: Colors.white,
          boxShadow: [BoxShadow(
              color: C.BLUE_1.withOpacity(0.1),
              offset:Offset(1,1),
              blurRadius:2,
              spreadRadius: 2
          )]
      ),
      child: InkWell(
        onTap:(){

        },
        child: Row(children: [
          Icon(Icons.language,size: D.default_25,color: C.BLUE_1,),
          Container(height: MediaQuery.of(context).size.height,color: C.RED_1,width: D.default_1,margin: EdgeInsets.only(top:D.default_5,bottom: D.default_5,left: D.default_10,right: D.default_10),),
          Expanded(child: Text(tr("pricing"),style:S.h4(color: C.GREY_1) ,)),
          Icon(Localizations.localeOf(context)==Locale('en', 'US')?Icons.arrow_forward_ios:Icons.arrow_back_ios,size: D.default_25,color: C.BLUE_1,),

        ],),),
    );
  }
  Widget _logout(){
    return Container(
      height: D.default_70,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(D.default_10),
      padding: EdgeInsets.all(D.default_10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_10),
          color: Colors.white,
          boxShadow: [BoxShadow(
              color: C.BLUE_1.withOpacity(0.1),
              offset:Offset(1,1),
              blurRadius:2,
              spreadRadius: 2
          )]
      ),
      child: InkWell(
        onTap:(){

        },
        child: Row(children: [
          Icon(Icons.language,size: D.default_25,color: C.BLUE_1,),
          Container(height: MediaQuery.of(context).size.height,color: C.RED_1,width: D.default_1,margin: EdgeInsets.only(top:D.default_5,bottom: D.default_5,left: D.default_10,right: D.default_10),),
          Expanded(child: Text(tr("logout"),style:S.h4(color: C.GREY_1) ,)),
          Icon(Localizations.localeOf(context)==Locale('en', 'US')?Icons.arrow_forward_ios:Icons.arrow_back_ios,size: D.default_25,color: C.BLUE_1,),

        ],),),
    );
  }

}


