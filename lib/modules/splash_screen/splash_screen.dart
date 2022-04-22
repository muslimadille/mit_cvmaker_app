import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../providers/utils_provider.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/constants.dart';
import '../../utils/my_utils.dart';
import '../../utils/widgets/transition_image.dart';
import '../base_screen/base_screen.dart';
import '../onboarding_screen/onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? prefs;
  UtilsProviderModel?utilsProviderModel;


  @override
  void initState() {
    super.initState();
    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen:false);
    _initPref(context);

  }
  @override
  Widget build(BuildContext context) {
    //loginProvider = Provider.of<LoginProvider>(context, listen: true);
    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen:true);
    _timerNavigation();
    return BaseScreen(body: Stack(
      alignment:AlignmentDirectional.center,
      children: [
        TransitionImage("assets/images/spalsh-bg.jpg",fit: BoxFit.cover,
          width: double.infinity,height: double.infinity,),

        Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,color: Colors.white.withOpacity(0.7),),
        TransitionImage(
          "assets/images/mitLogo.png",
          fit: BoxFit.fitWidth,
          width: D.default_150,
          height: D.default_150,
        )


      ],
    ));
  }
  void _timerNavigation(){
  if(mounted) {
    Future.delayed(Duration(milliseconds: 5000)).then((value) {
      MyUtils.navigateReplaceCurrent(context, OnBoardingScreen());
    });
  }

  }
  void _initPref(BuildContext ctx)async{
    prefs =  await SharedPreferences.getInstance();
    Constants.prefs=prefs;
    String local= await Constants.prefs!.get(Constants.LANGUAGE_KEY!)!=null?Constants.prefs!.get(Constants.LANGUAGE_KEY!).toString():"ar";
     if(local=="ar"){
       utilsProviderModel!.setCurrentLocal(ctx, Locale('ar', 'EG'));
     }else{
       utilsProviderModel!.setCurrentLocal(ctx, Locale('en', 'US'));
     }
    //_initSavedUser();

  }
  /*_initSavedUser(){
    if( Constants.prefs!.get(Constants.SAVED_PHONE_KEY!)!=null&&Constants.prefs!.get(Constants.SAVED_PHONE_KEY!).toString().isNotEmpty&&Constants.prefs!.get(Constants.SAVED_PASSWORD_KEY!)!=null){
      loginProvider!.login(context,Constants.prefs!.get(Constants.SAVED_PHONE_KEY!).toString(),Constants.prefs!.get(Constants.SAVED_PASSWORD_KEY!).toString());
    }
  }*/
}
