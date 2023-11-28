
import 'package:fix_bottom_tab/add_page.dart';
import 'package:fix_bottom_tab/categgory_page.dart';
import 'package:fix_bottom_tab/home_page.dart';
import 'package:fix_bottom_tab/notification_page.dart';
import 'package:fix_bottom_tab/profile_page.dart';
import 'package:flutter/material.dart';
// import 'package:new_version/new_version.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:yaatri_kavach/features/JobValidation/presentation/pages/JobValidationScreen.dart';
// import '../../../../core/Utils/Utils.dart';
// import '../../../../core/widgets/CustBottomBar.dart';
// import '../../../Home/presentation/pages/HomeScreen.dart';
// import '../../../Kavach/presentation/pages/KavachScreen.dart';
// import '../../../Notification/presentation/pages/NotificationScreen.dart';
// import '../../../QueryStatus/presentation/pages/QueryStatusScreen.dart';
// import '../../../RaiseQuery/presentation/pages/RaiseQueryScreen.dart';
// import '../../../Support/presentation/pages/SupportScreen.dart';
import 'Utils.dart';
import 'custom_bottom_tab.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  String? ttype;

  // onPageLoad() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     ttype = prefs.getString("travel_type");
  //     log("On Start Load================ $ttype");
  //   });
  // }

  // @override
  // void initState() {
  //   checkUpdate();
  //   onLoading();
  //   // onPageLoad();
  //   super.initState();
  // }

  bool payment = true;
  String? travelType;
  // bool isKavach = true;
  // onLoading() async {
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     payment = prefs.getBool("payment") ?? false;
  //     travelType = prefs.getString('travel_type');
  //   });
  // }

  // void checkUpdate() async {
  //   final newVersion = NewVersion(
  //       androidId: "com.science.sciencenow", iOSId: "com.science.sciencenow");
  //   try {
  //     final status = await newVersion.getVersionStatus();

  //     if (status != null) {
  //       if (status.canUpdate) {
  //         newVersion.showUpdateDialog(
  //             context: context,
  //             versionStatus: status,
  //             dialogTitle: "Update!!!",
  //             dismissButtonText: "Later",
  //             dialogText:
  //                 "Please update your app from ${status.localVersion} to ${status.storeVersion}",
  //             allowDismissal: false,
  //             dismissAction: () {
  //               SystemNavigator.pop();
  //             },
  //             updateButtonText: "Let's Update");
  //       }
  //       // print("app version on Device " status.localVersion);
  //       // print("app version on store " status.storeVersion);
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

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
              // case '/kavach':
                // page = KavachScreen(payment: travelType != null ? true : false);
                // break;
              // case '/Validation':
              //   // onLoading();
              //   page = JobValidationScreen(
              //     payment: payment,
              //   );
                // break;
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
      //  Navigator.pop(context);
      //   return false;
    } else {
      Navigator.pop(context);
      return false;

      // return await showDialog(
      //   context: context,
      //   builder: (context) {
      //     return AlertDialog(
      //       title: const Text('Are you sure?'),
      //       content: const Text('Do you want to exit an App'),
      //       actions: <Widget>[
      //         Padding(
      //           padding: const EdgeInsets.only(bottom: 8.0),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               InkWell(
      //                   onTap: () {
      //                     Navigator.of(context).pop(false);
      //                   },
      //                   child: const Text('No', style: TextStyle(fontSize: 20),)),
      //               InkWell(
      //                   onTap: () {
      //                     Navigator.of(context).pop(true);
      //                   },
      //                   child: const Text('Yes',style: TextStyle(fontSize: 20)))
      //             ],
      //           ),
      //         )
      //       ],
      //     );
      //   },
      // ) ?? false;
    }
  }
}
