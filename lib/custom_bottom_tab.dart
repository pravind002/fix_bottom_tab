import 'package:flutter/material.dart';

import 'Utils.dart';

class CustBottomBar extends StatefulWidget {
  static bool isDark = false;
  const CustBottomBar({Key? key}) : super(key: key);

  @override
  State<CustBottomBar> createState() => _CustBottomBarState();
}

class _CustBottomBarState extends State<CustBottomBar> {
  // var menuItem = [
  //   {"icon": "assets/icons/home.png", "title": "Home"},
  //   {"icon": "assets/icons/status.png", "title": "Query Status"},
  //   {"icon": "assets/icons/add.png", "title": "Raise Query"},
  //   {"icon": "assets/icons/shield.png", "title": "Kavach"},
  //   {"icon": "assets/icons/check.png", "title": "Validation"}
  // ];

  List menuItem = [
    {"icon": Icons.home, "title": "Home"},
    {"icon": Icons.category, "title": "Category"},
    {"icon": Icons.add, "title": "Add"},
    {"icon": Icons.notifications_on, "title": "Notification"},
    {"icon": Icons.person, "title": "Profile"}
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  color: Colors.white.withOpacity(0.2),
                  offset: Offset.zero)
            ]),
        height: 65,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: menuItem.length,
          shrinkWrap: true,
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(
                  right: (MediaQuery.of(context).size.width / 6) * 0.35),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: index != 2
                        ? Icon(
                            menuItem[index]['icon'],
                            size: selectedIndex == index ? 35 : 30,
                            color: selectedIndex == index
                                ? const Color(0xff21619A)
                                : const Color(0xff857B7B),
                          )
                        // ImageIcon(
                        //   AssetImage("${menuItem[index]["icon"]}"),
                        //   color: selectedIndex == index ? const Color(0xff21619A) : const Color(0xff857B7B),
                        //   size: selectedIndex == index ? 35 : 30,
                        // )
                        : Container(
                            height: selectedIndex == index ? 35 : 30,
                            width: selectedIndex == index ? 35 : 30,
                            clipBehavior: Clip.none,
                            decoration: BoxDecoration(
                                color: selectedIndex == index
                                    ? const Color(0xff21619A)
                                    : const Color(0xffFF6854),
                                borderRadius: BorderRadius.circular(180)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });

                      switch (index) {
                        case 0:
                          Utils.mainListNav.currentState!.pushNamed(
                            '/homepage',
                          );
                          break;
                        case 1:
                          Utils.mainListNav.currentState!
                              .pushNamed('/category');
                          break;
                        case 2:
                          Utils.mainListNav.currentState!.pushNamed('/add');
                          break;
                        case 3:
                          Utils.mainListNav.currentState!
                              .pushNamed('/notification');
                          break;
                        case 4:
                          Utils.mainListNav.currentState!.pushNamed('/profile');
                          break;
                        // case 5:
                        //   Utils.mainListNav.currentState!
                        //       .pushNamed('/Validation');
                        //   break;
                      }
                    },
                  ),
                  Text(
                    "${menuItem[index]["title"]}",
                    style: TextStyle(
                        color: selectedIndex == index
                            ? const Color(0xff21619A)
                            : const Color(0xff857B7B),
                        fontSize: 10),
                  )
                ],
              ),
            );
          },
        ));
  }
}
