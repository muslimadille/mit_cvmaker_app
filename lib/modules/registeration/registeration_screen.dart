
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/input_validation_mixin.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_utils.dart';
import '../../utils/widgets/base_botton.dart';
import '../../utils/widgets/base_text_files.dart';
import '../../utils/widgets/loading_widget.dart';
import '../../utils/widgets/transition_image.dart';
import '../base_screen/base_screen.dart';
import '../login_screen/login_screen.dart';
import '../main_tabs_screen/main_tabs_screen.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({Key? key}) : super(key: key);

  @override
  _RegisterationScreenState createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> with InputValidationMixin{
  final _registerFormGlobalKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _fristNmaeController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _phoneKeyController = TextEditingController();
  //RegisterProvider? registerProvider;
  //CountryCode? selectedCode;
  int  mobileLength=10;
  String mobileText="";


@override
  void initState() {
    super.initState();
    //registerProvider = Provider.of<RegisterProvider>(context, listen: false);
    _phoneNumberController.addListener(() {
      if(_phoneNumberController.text.length>mobileLength){
        setState(() {
          _phoneNumberController.text=mobileText;
        });
      }else{
        mobileText=_phoneNumberController.text;
      }
    });
}



  @override
  Widget build(BuildContext context) {
    //registerProvider = Provider.of<RegisterProvider>(context, listen: true);
    return BaseScreen(body: SafeArea(child: Stack(
      alignment:AlignmentDirectional.center,
      children: [
        TransitionImage("assets/images/spalsh-bg.jpg",fit: BoxFit.cover,
          width: double.infinity,height: double.infinity,),
        Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,color: Colors.white.withOpacity(0.7),),
        Container(
          margin: EdgeInsets.only(left: D.default_40,right: D.default_40),
          width: double.infinity,
          child: Column(children: [
            _backBtn(),
            Expanded(child: SingleChildScrollView(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: D.default_60,),
                _titleText(),
                _introText(),
                SizedBox(height: D.default_40,),
                _deviderPart(),
                SizedBox(height: D.default_20,),
                _loginForm(),
                SizedBox(height: D.default_40,),
                _loginButton(),
                _havAccountButton(),
                _skip(),
                SizedBox(height: D.default_60,)
              ],),))
          ],),),
       // registerProvider!.isLoading?LoadingProgress():Container()
      ],
    ),));
  }
  Widget _backBtn(){
    return Container(
      padding: EdgeInsets.only(top:D.default_10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(onPressed:(){
            Navigator.of(context).pop();
          }, icon: Icon(Icons.arrow_back_ios,color: C.GREY_1,size: D.default_30,))
        ],),);
  }
  Widget _introText(){
    return Container(
      width: double.infinity,
      child: Text(tr("registeration_text"),style: S.h3(color:C.GREY_3),textAlign: TextAlign.center,),);

  }
  Widget _titleText(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: D.default_10,bottom:D.default_10),
      child: Text(tr("register_title"),style: S.h1(color:Colors.black),textAlign: TextAlign.center,),);

  }

  Widget _loginButton(){
    return BaseButton(
      onItemClickListener: (){
        _onRegisterClicked();
      },
      title: tr("register"),
      color: C.BLUE_1,
      textStyle: S.h3(color: Colors.white),
      margin: EdgeInsets.all(D.default_5),
    );
  }
  Widget _havAccountButton(){
    return BaseButton(
      onItemClickListener: (){
        MyUtils.navigateReplaceCurrent(context, LoginScreen());
      },
      title: tr("have_account_title"),
      color: C.GREY_4,
      textStyle: S.h3(color: C.GREY_1),
      enableShadow: false,
      margin: EdgeInsets.all(D.default_5),

    );
  }
  Widget _skip(){
    return BaseButton(
      onItemClickListener: (){
        MyUtils.navigate(context, MainTabsScreen());
      },
      title: tr("skip_title"),
      textStyle: S.h2(color: C.BLUE_1,underline: true),
      margin: EdgeInsets.all(0),
      enableShadow: false,
      color: Colors.white,

    );

  }
  Widget _deviderPart(){
    return Container(child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child:
        Container(
          height: D.default_1,
          width: D.default_100,
          color: C.GREY_4,),),
        Container(
          margin:EdgeInsets.all(D.default_10),
          child: Text(tr("or_text"),style: S.h3(color: C.GREY_2),),),
        Expanded(child: Container(height: D.default_1,width: D.default_100,color: C.GREY_4,))

      ],
    ),);
  }
  Widget _loginForm(){
    return Container(child:
    Form(
      key: _registerFormGlobalKey,
      child: Column(
        children: [
          BaseTextFiled(
            controller: _emailController,
            hint: tr("email"),
            validator: (name) {
              if (isFieldNotEmpty(name!)) {
                if(isEmailValid(name)){
                  return null;
                }else{
                  return tr("enter_email");
                }
              } else {
                return tr("enter_email");
              }
            },
          ),
          SizedBox(height: D.default_15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Expanded(child: BaseTextFiled(
              controller: _fristNmaeController,
              hint: tr("first_name"),
                validator: (name) {
                  if (isFieldNotEmpty(name!)) {
                    return null;
                  } else {
                    return tr("enter_first_name");
                  }
                }
            )),
            SizedBox(width: D.default_10,),
            Expanded(child: BaseTextFiled(
              controller: _lastNameController,
              hint: tr("last_name"),
                validator: (name) {
                  if (isFieldNotEmpty(name!)) {
                    return null;
                  } else {
                    return tr("enter_last_name");
                  }
                }
            )),
          ],),
          SizedBox(height: D.default_15,),
          BaseTextFiled(
              controller: _phoneNumberController,
              hint: tr("phone_num"),
              isPassword: false,
              inputType: TextInputType.phone,
              validator: (name) {
                if (isFieldNotEmpty(name!)) {
                  return null;
                } else {
                  return tr("enter_phone");
                }
              }
          ),
          SizedBox(height: D.default_15,),
          BaseTextFiled(
            controller: _passwordController,
            hint: tr("password"),
            isPassword: true,
              validator: (name) {
                if (isFieldNotEmpty(name!)) {
                  return null;
                } else {
                  return tr("enter_password");
                }
              }
          ),
        ],
      ),
    ),);
  }
  _onRegisterClicked() {
    /*if (_registerFormGlobalKey.currentState!.validate()) {
      _registerFormGlobalKey.currentState!.save();

      //call register api
      registerProvider!.register(
          context,
          _fristNmaeController.text,
          _lastNameController.text,
          _emailController.text.replaceAll(" ", ""),
          _phoneNumberController.text,
          _passwordController.text);
    }*/
  }

}
