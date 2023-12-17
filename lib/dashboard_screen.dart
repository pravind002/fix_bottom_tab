import 'package:fix_bottom_tab/add_page.dart';
import 'package:fix_bottom_tab/categgory_page.dart';
import 'package:fix_bottom_tab/home_page.dart';
import 'package:fix_bottom_tab/notification_page.dart';
import 'package:fix_bottom_tab/profile_page.dart';
import 'package:flutter/material.dart';
import 'Utils.dart';
import 'custom_bottom_tab.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  String? ttype;

  bool payment = true;
  String? travelType;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Navigator(
          key: Utils.mainListNav,
          // initialRoute: '/homepage',
          onGenerateRoute: (RouteSettings settings) {
            Widget page;
            switch (settings.name) {
              case '/homepage':
                page = const HomePage();
                break;
              case '/category':
                page = const CategoryPage();
                break;
              case '/add':
                page = const NotificationPage();
                break;
              case '/notification':
                page = const ProfilePage();
                break;
              case '/profile':
                page = const AddPage();
                break;

              default:
                page = const HomePage();
                break;
            }
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => page,
                transitionDuration: const Duration(seconds: 0));
          },
        ),
        bottomNavigationBar: const CustBottomBar(),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    if (await Utils.mainListNav.currentState!.maybePop()) {
      return await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('Do you want to exit an App'),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(fontSize: 20),
                            )),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pop(true);
                            },
                            child: const Text('Yes',
                                style: TextStyle(fontSize: 20)))
                      ],
                    ),
                  )
                ],
              );
            },
          ) ??
          false;
    
    } else {
      Navigator.pop(context);
      return false;

    }
  }
}
