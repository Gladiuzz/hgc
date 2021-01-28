import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hgc/cubit/user_cubit.dart';
import 'package:hgc/service/HandicapAPI.dart';
import 'package:hgc/service/UserAPI.dart';
import 'package:hgc/ui/pages/Home/History/history.dart';
import 'package:hgc/ui/pages/Home/Play/play.dart';
import 'package:hgc/ui/pages/Home/Profile/Profile.dart';
import 'package:hgc/ui/pages/Home/homeFragment.dart';
import 'package:hgc/ui/pages/Inbox/Inbox.dart';
import 'package:hgc/ui/pages/onboarding.dart';
import 'package:hgc/ui/pages/register.dart';
import 'package:hgc/ui/pages/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PersistentTabController _controller;
  bool _hideNavBar;

  PageController _pageController = PageController();
  List<Widget> _screen = [
    HomeFragment(),
    History(),
    Play(),
    Inbox(),
    Profile()
  ];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;

    // UserApi().showUser().then((value) {
    //   print("hah ${value.name}");
    //   context.bloc<UserCubit>().getUser(value);
    // });
    HandicapAPI().showHandicap().then((value) {
      // handicap = value;
    });
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        activeColor: const Color(0xffb90b0c),
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.history),
        title: ("History"),
        activeColor: const Color(0xffb90b0c),
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          _selectedIndex == 2
              ? "assets/icons/golf_sticks_aktif.svg"
              : "assets/icons/golf_sticks_aktif.svg",
          height: 50.0,
          width: 50.0,
        ),
        activeColor: const Color(0xffb90b0c),
        inactiveColor: Colors.grey,
        title: ("Play"),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.mail),
        title: ("Inbox"),
        activeColor: const Color(0xffb90b0c),
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        activeColor: const Color(0xffb90b0c),
        inactiveColor: Colors.grey,
      ),
    ];
  }

  void _onItemTapped(int selectedIndex) {
    setState(() {
      _pageController.jumpToPage(selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Scaffold(
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[const Text('This is the drawer')],
          ),
        ),
      ),
      body: PersistentTabView(
        controller: _controller,
        screens: _screen,
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        popActionScreens: PopActionScreensType.once,
        bottomScreenMargin: 0.0,
        navBarStyle: NavBarStyle.style6,
      ),
    ));
  }
}
