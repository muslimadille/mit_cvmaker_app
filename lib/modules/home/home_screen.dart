
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/baseDimentions.dart';
import '../base_screen/base_screen.dart';
import 'elements/home_header_widget.dart';
import 'elements/tamplet_item_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BaseScreen(body:
    Stack(children: [
      Container(
        child: Column(children: [
          HomeHeaderWidget(),
          SizedBox(height: D.default_100,),
          Expanded(child: SingleChildScrollView(child: Column(children: [
            TemplateItemListWidget(tr("previous_temp"),tr("create_temp")),
            TemplateItemListWidget(tr("templates"),tr("more")),
          ],),))

        ],),
      ),
    ],)));
  }



}
