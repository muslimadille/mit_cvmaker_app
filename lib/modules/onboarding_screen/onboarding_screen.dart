
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/constants.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_utils.dart';
import '../../utils/widgets/base_botton.dart';
import '../../utils/widgets/transition_image.dart';
import '../base_screen/base_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(body: Stack(
      alignment:AlignmentDirectional.bottomCenter,
      children: [
        TransitionImage("assets/images/spalsh-bg.jpg",fit: BoxFit.cover,
          width: double.infinity,height: double.infinity,),
        Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,color: Colors.white.withOpacity(0.7),),

        Container(
          margin: EdgeInsets.all(D.default_25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          _logo(),
          _introText(),
          _subtitleText(),
            _createCVButton(),
            SizedBox(height: D.default_60,),
            _loginButton(),
            _registerButton(),
        ],),)


      ],
    ));
  }
  Widget _or(){
    return Container(
      margin: EdgeInsets.all(D.default_20),
      child: Text(tr("OR"),style: S.h2(color: C.BLUE_1),),);
  }
  Widget _logo(){
    return TransitionImage("assets/images/mitLogo.png",fit: BoxFit.fitWidth,
        width:D.default_150);
  }
  Widget _introText(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: D.default_10,bottom:D.default_10),
      child: Text(tr("Create your\nprofessional Resume\nwith Mit"),style: S.hB(color:C.BLUE_1),textAlign: TextAlign.center,),);

  }
  Widget _subtitleText(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: D.default_10,bottom:D.default_10),
      child: Text(tr("Create your very own professional Resume and download it\nwithin 15 minutes"),style: S.h3(color:C.GREY_3),textAlign: TextAlign.center,),);

  }
  Widget _loginButton(){
    return BaseButton(
      onItemClickListener: (){
        //MyUtils.navigate(context, LoginScreen());
      },
      title: tr("Login"),
      color: C.BLUE_1,
      textStyle: S.h3(color: Colors.white),
      margin: EdgeInsets.all(D.default_5),
    );
  }
  Widget _createCVButton(){
    return BaseButton(
      onItemClickListener: (){
        //MyUtils.navigate(context, LoginScreen());
      },
      title: tr("Create Your Resume"),
      color: C.BLUE_1,
      textStyle: S.h3(color: Colors.white),
      width: D.default_180,
      margin: EdgeInsets.all(D.default_5),
    );
  }
  Widget _registerButton(){
    return BaseButton(
      onItemClickListener: (){
        //MyUtils.navigate(context, RegisterationScreen());
      },
      title: tr("Register"),
      color: C.GREY_4,
      textStyle: S.h3(color: C.GREY_1),
      enableShadow: false,
      margin: EdgeInsets.all(D.default_5),

    );
  }
  Widget _skip(){
    return BaseButton(
      onItemClickListener: (){
        //MyUtils.navigate(context, MainTabsScreen());
      },
      title: tr("skip_title"),
      textStyle: S.h2(color: C.BLUE_1,underline: true),
      margin: EdgeInsets.all(0),
      enableShadow: false,
      color: Colors.white,

    );

  }
}
