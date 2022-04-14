import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mit_cvmaker_app/providers/utils_provider.dart';
import 'package:provider/provider.dart';

import 'modules/splash_screen/splash_screen.dart';
typedef dynamic OnItemClickListener();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<UtilsProviderModel>(create: (ctx) => UtilsProviderModel(),),
  ],
    child:EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
        path: 'assets/strings', // <-- change the path of the translation files
        fallbackLocale: const Locale('ar', 'EG'),
        child: const MyApp()
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.setLocale(const Locale('ar', 'EG'));
    //EasyLocalization.of(context)!.setLocale(const Locale('ar', 'EG'));
    UtilsProviderModel utilsProviderModel;
    utilsProviderModel=Provider.of<UtilsProviderModel>(context,listen: true);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor:Colors.blue,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: utilsProviderModel.currentLocal,
      debugShowCheckedModeBanner: false,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.black.withOpacity(0.7),
          ),
          child: const SplashScreen()) ,
    );
  }
}


