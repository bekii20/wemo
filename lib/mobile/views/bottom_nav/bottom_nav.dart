import 'package:etiocart/constants/theme_data.dart';
import 'package:etiocart/mobile/views/discover/discover.dart';
import 'package:etiocart/mobile/views/notification/notifications.dart';
import 'package:etiocart/mobile/views/profile/profile.dart';
import 'package:etiocart/mobile/views/profile/view_profile.dart';
import 'package:etiocart/mobile/views/search/custom_search.dart';
import 'package:etiocart/mobile/views/transport/transport_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../moments/moments_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();


}

class _BottomNavState extends State<BottomNav> {


  @override
  Widget build(BuildContext context) {
    return bottomNav();
  }
  int _selectedIndex = 0;
  int currentIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Discover(),
    const MomentsPage(),
    const TransportPage(),
    const ProfilePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bottomNav() {
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: StylingData.bgColor,
          foregroundColor: StylingData.frColor,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 15),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        showSearch(context: context, delegate: CustomSearch());
                      },
                      icon: ImageIcon(
                          color: Colors.green.shade800,
                          size: 25,
                          AssetImage(
                            'asset/icons/search.png',
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Notifications()),
                        );
                      },
                      child: ImageIcon(
                          color: Colors.green.shade800,
                          size: 25,
                          AssetImage(
                            'asset/icons/bell.png',
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewProfile()),
                        );
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey[200],
                        backgroundImage:AssetImage(
                          'asset/icons/user.png',
                        ) ,
                      )
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            enableFeedback: false,
            backgroundColor: Colors.white,
            selectedIconTheme: const IconThemeData(),
            type: BottomNavigationBarType.fixed,
            onTap: onTabTapped,
            items: <BottomNavigationBarItem>[
              // discover item
              BottomNavigationBarItem(
                icon:
                    Image.asset(
                  "asset/icons/compass.png",
                  width: width * 0.23,
                  height: width * 0.05,
                  color: Colors.black,
                ),
                label: 'Discover',
              ),
              // moments item
              BottomNavigationBarItem(
                icon: Image.asset(
                  "asset/icons/camera.png",
                  width: width * 0.23,
                  height: width * 0.05,
                  color: Colors.black,
                ),
                label: 'Moments',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "asset/icons/bus.png",
                  width: width * 0.23,
                  height: width * 0.05,
                  color: Colors.black,
                ),
                label: 'Transport',
              ),
              // profile item
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                label: 'Profile',
                icon: Image.asset(
                  "asset/icons/user.png",
                  width: width * 0.23,
                  height: width * 0.05,
                  color: Colors.black,
                ),
              ),
            ],
            elevation: 0,
            iconSize: 20,
            // unselectedLabelStyle: TextStyle(color: Colors.teal.shade800),
            // selectedLabelStyle: TextStyle(color: Colors.teal.shade800),
            currentIndex: _selectedIndex,
            // selectedItemColor: Colors.teal.shade800,
          ),
        ),
      ),
    );
  }
}
