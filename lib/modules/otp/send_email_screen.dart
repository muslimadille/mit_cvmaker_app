import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mit_cvmaker_app/modules/otp/use_code_screen.dart';
import 'package:mit_cvmaker_app/utils/my_utils.dart';
import 'package:provider/provider.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/input_validation_mixin.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets/base_botton.dart';
import '../../utils/widgets/base_text_files.dart';
import '../../utils/widgets/transition_image.dart';
import '../base_screen/base_screen.dart';

class SendOtpEmailScreen extends StatefulWidget {
  const SendOtpEmailScreen({Key? key}) : super(key: key);

  @override
  _SendOtpEmailScreenState createState() => _SendOtpEmailScreenState();
}

class _SendOtpEmailScreenState extends State<SendOtpEmailScreen>
    with InputValidationMixin {
  final _loginFormGlobalKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  //LoginProvider? loginProvider;

  @override
  void initState() {
    super.initState();
    // loginProvider=Provider.of<LoginProvider>(context,listen:false);
  }

  @override
  Widget build(BuildContext context) {
    //loginProvider=Provider.of<LoginProvider>(context,listen:true);
    return BaseScreen(
        body: SafeArea(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          TransitionImage(
            "assets/images/login_blue_bg.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            margin: EdgeInsets.only(left: D.default_50, right: D.default_40),
            width: double.infinity,
            child: Column(
              children: [
                _backBtn(),
                Expanded(
                    child: SingleChildScrollView(
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 15,
                            color: Colors.white,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: D.default_100,
                                  ),
                                  _titleText(),
                                  _introText(),
                                  SizedBox(
                                    height: D.default_60,
                                  ),
                                  _loginForm(),
                                  SizedBox(
                                    height: D.default_40,
                                  ),
                                  _sendButton(),
                                  SizedBox(
                                    height: D.default_10,
                                  ),
                                  _cancelButton(),
                                  SizedBox(
                                    height: D.default_150,
                                  ),
                                ],
                              ),
                            ))))
              ],
            ),
          ),
          //loginProvider!.isLoading?LoadingProgress():Container()
        ],
      ),
    ));
  }

  Widget _backBtn() {
    return Container(
      padding: EdgeInsets.only(top: D.default_10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: D.default_30,
              ))
        ],
      ),
    );
  }

  Widget _introText() {
    return Container(
      width: double.infinity,
      child: Text(
        tr("change_password_text"),
        style: S.h3(color: C.GREY_3),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _titleText() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: D.default_10, bottom: D.default_10),
      child: Text(
        tr("change_password_text"),
        style: S.h1(color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _sendButton() {
    return BaseButton(
      onItemClickListener: () {
        MyUtils.navigate(context, OtpScreen("otpFalge", "title"));
        /*if (_loginFormGlobalKey.currentState!.validate()) {
          _loginFormGlobalKey.currentState!.save();
          loginProvider!.getAuthCode(context,_emailController.text);

        }*/
      },
      title: tr("send_email_screen_title"),
      color: C.BLUE_1,
      textStyle: S.h3(color: Colors.white),
      margin: EdgeInsets.all(D.default_5),
    );
  }

  Widget _cancelButton() {
    return BaseButton(
      onItemClickListener: () {
        Navigator.pop(context);
      },
      title: tr("cancel_text"),
      color: Colors.white,
      enableShadow: false,
      textStyle: S.h3(color: Colors.black),
      margin: EdgeInsets.all(D.default_5),
    );
  }

  Widget _loginForm() {
    return Container(
      child: Form(
        key: _loginFormGlobalKey,
        child: Column(
          children: [
            BaseTextFiled(
              controller: _emailController,
              hint: tr("email_text"),
              validator: (name) {
                if (isFieldNotEmpty(name!)) {
                  return null;
                } else {
                  return tr("enter_email");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
