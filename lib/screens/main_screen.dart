import 'package:arigram/screens/Home_screen.dart';
import 'package:arigram/screens/activity_screen.dart';
import 'package:arigram/screens/add_content_scrreen.dart';
import 'package:arigram/screens/searchscreen.dart';
import 'package:arigram/screens/user_profile.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIconBottomNavigation = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIconBottomNavigation,
              onTap: (int index) {
                setState(() {
                  _selectedIconBottomNavigation = index;
                });
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xff272B40),
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('images/icon_home.png'),
                  activeIcon: Image.asset('images/icon_active_home.png'),
                  label: 'item1',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/icon_search.png'),
                  activeIcon:
                      Image.asset('images/icon_search_navigation_active.png'),
                  label: 'item2',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/icon_add_navigation.png'),
                  activeIcon:
                      Image.asset('images/icon_add_navigation_active.png'),
                  label: 'item3',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/icon_activity_navigation.png'),
                  activeIcon:
                      Image.asset('images/icon_activity_navigation_active.png'),
                  label: 'item4',
                ),
                BottomNavigationBarItem(
                  icon: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(50),
                    padding: EdgeInsets.all(4),
                    color: Color(0xffC5C5C5),
                    dashPattern: [10, 4],
                    strokeWidth: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(48)),
                      child: Container(
                        height: 25,
                        width: 25,
                        child: Image.asset('images/1.jpg'),
                      ),
                    ),
                  ),
                  activeIcon: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(50),
                    padding: EdgeInsets.all(4),
                    color: Color(0xffF35383),
                    dashPattern: [10, 4],
                    strokeWidth: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(48)),
                      child: Container(
                        height: 25,
                        width: 25,
                        child: Image.asset('images/1.jpg'),
                      ),
                    ),
                  ),
                  label: 'item1',
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: _selectedIconBottomNavigation,
          children: getLayout(),
        ));
  }

  List<Widget> getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      Addcontent(),
      ActivityScreen(),
      UserProfilePage(),
    ];
  }
}
