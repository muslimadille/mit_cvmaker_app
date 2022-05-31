
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../utils/constants.dart';
import '../home/home_screen.dart';
import '../login_screen/login_screen.dart';
import '../tempelates/templates_screen.dart';
import 'bottom_bar_icons.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_utils.dart';
import '../base_screen/base_screen.dart';


class MainTabsScreen extends StatefulWidget {
  MainTabsScreen();

  @override
  _MainTabsScreenState createState() => _MainTabsScreenState();
}

class _MainTabsScreenState extends State<MainTabsScreen> {
  PersistentTabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    Constants.tabScreenContext=context;
    return BaseScreen(
        body: Column(
      children: [
        Expanded(child: _tabs()),
      ],
    ));
  }

  Widget _tabs() {
    return PersistentTabView(
      context,
      controller: _controller,
      padding: NavBarPadding.all(D.default_18),
        navBarHeight: D.default_90,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: C.BLUE_1,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: false,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style10,
      onItemSelected: (index){
        if(/*index>1&&Constants.currentUser==null*/false){
          MyUtils.navigateReplaceCurrent(Constants.tabScreenContext!, LoginScreen());
          _controller!.index=0;
          _controller!.jumpToTab(0);
        }
      },// Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
       TemplatesScreen(),
      const HomeScreen(),
      const HomeScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [

      PersistentBottomNavBarItem(
        icon:  Icon(MyFlutterApp.products_default,size: D.default_27,),
        title: (tr("templates")),
        textStyle: S.h5(),
        activeColorPrimary: C.BLUE_2,
        activeColorSecondary:C.RED_1,
        inactiveColorSecondary:CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
          icon:  Icon(MyFlutterApp.home_active,size: D.default_27,),
          title: (tr("home")),
          textStyle: S.h5(),
          activeColorPrimary: C.BLUE_2,
          activeColorSecondary:C.RED_1,
          inactiveColorSecondary:CupertinoColors.white,
          inactiveColorPrimary: CupertinoColors.white,
          contentPadding: D.default_5
      ),
      /*PersistentBottomNavBarItem(
        icon:  Icon(MyFlutterApp.orders_defauls,size: D.default_27,),
        title: (tr("pricing")),
        textStyle: S.h5(),
        activeColorPrimary: C.BLUE_2,
        activeColorSecondary:C.BLUE_2,
        inactiveColorSecondary:CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.white,

      ),*/
      PersistentBottomNavBarItem(
        icon:  Icon(MyFlutterApp.more_default,size: D.default_27,),
        textStyle: S.h5(),
        title: (tr("more")),
        activeColorPrimary: C.BLUE_2,
        activeColorSecondary:C.RED_1,
        inactiveColorSecondary:CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.white,
      ),
    ];
  }
}
