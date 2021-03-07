import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hgc/cubit/bookings_cubit.dart';
import 'package:hgc/cubit/user_cubit.dart';
import 'package:hgc/service/BookingAPI.dart';
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
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }

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
    BookingApi().showBookedTournament().then((value) {
      print("bookingan ${value}");
      context.bloc<BookingsCubit>().getActiveTournament(value);
    });
  }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: Icon(Icons.home),
  //       title: "Home",
  //       activeColor: const Color(0xffb90b0c),
  //       inactiveColor: Colors.grey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(Icons.history),
  //       title: ("History"),
  //       activeColor: const Color(0xffb90b0c),
  //       inactiveColor: Colors.grey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: SvgPicture.asset(
  //         _selectedIndex == 2
  //             ? "assets/icons/golf_sticks_aktif.svg"
  //             : "assets/icons/golf_sticks_aktif.svg",
  //         height: 50.0,
  //         width: 50.0,
  //       ),
  //       activeColor: const Color(0xffb90b0c),
  //       inactiveColor: Colors.grey,
  //       title: ("Play"),
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(Icons.mail),
  //       title: ("Inbox"),
  //       activeColor: const Color(0xffb90b0c),
  //       inactiveColor: Colors.grey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(Icons.person),
  //       title: ("Profile"),
  //       activeColor: const Color(0xffb90b0c),
  //       inactiveColor: Colors.grey,
  //     ),
  //   ];
  // }

  void _onItemTapped(int selectedIndex) {
    setState(() {
      _pageController.jumpToPage(selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xffed2025),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color:
                  _selectedIndex == 0 ? const Color(0xffb90b0c) : Colors.grey,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12,
                color: Color(_selectedIndex == 0 ? 0xffed2025 : 0xff888888),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                color:
                    _selectedIndex == 1 ? const Color(0xffb90b0c) : Colors.grey,
              ),
              title: Text(
                'History',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  color: Color(_selectedIndex == 1 ? 0xffed2025 : 0xff888888),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              )),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _selectedIndex == 2
                  ? "assets/icons/golf_sticks_aktif.svg"
                  : "assets/icons/non_selected_icn.svg",
              height: 22.0,
              width: 22.0,
            ),
            title: Container(
              margin: EdgeInsets.only(top: 4),
              child: Text(
                'Play',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  color: Color(_selectedIndex == 2 ? 0xffed2025 : 0xff888888),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail,
              color:
                  _selectedIndex == 3 ? const Color(0xffb90b0c) : Colors.grey,
            ),
            title: Text(
              'Inbox',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12,
                color: Color(_selectedIndex == 3 ? 0xffed2025 : 0xff888888),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color:
                  _selectedIndex == 4 ? const Color(0xffb90b0c) : Colors.grey,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12,
                color: Color(_selectedIndex == 4 ? 0xffed2025 : 0xff888888),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
