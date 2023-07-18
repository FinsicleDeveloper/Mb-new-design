import 'package:design/constants/appcolors.dart';
import 'package:design/design/indicators/page_indicator.dart';
import 'package:design/design/login/functions/listen_to_auth_changes.dart';
import 'package:design/design/login/functions/login_functions.dart';
import 'package:design/design/news/news_home.dart';
import 'package:design/design/web/web_view.dart';
import 'package:design/design/widgets/confirm_alert_box.dart';
import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pageController = PageController();
  final googleSignIn = GoogleSignIn();

  // ignore: unused_field
  int _currentIndex = 0;
  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = const [
    PageIndicator(),
    NewsHome(),
    WebView(url: 'assets/web/market_view.html'),
    WebView(url: "assets/web/economic_calender.html")
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBlackedColor,
        extendBody: true,
        body: Padding(
          padding: EdgeInsets.only(top: size.height * 0.01),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                color: Colors.grey[900]),
            child: Padding(
              padding: _currentIndex != 1
                  ? const EdgeInsets.only(top: 25.0)
                  : const EdgeInsets.only(top: 2.0),
              child: PageView(
                controller: pageController,
                onPageChanged: onPageChanged,
                physics: const NeverScrollableScrollPhysics(),
                children: _pages,
              ),
            ),
          ),
        ),
        bottomNavigationBar: DotNavigationBar(
          backgroundColor: AppColors.kBlackedColor,
          selectedItemColor: AppColors.kWhite,
          unselectedItemColor: Colors.grey,
          marginR: const EdgeInsets.symmetric(horizontal: 42.0, vertical: 20),
          paddingR: const EdgeInsets.only(bottom: 5, top: 5),
          currentIndex: _currentIndex,
          onTap: (int index) {
            pageController.jumpToPage(index);
          },
          items: [
            DotNavigationBarItem(
                icon: const Icon(
              Icons.speed,
            )),
            DotNavigationBarItem(icon: const Icon(Icons.feed)),
            DotNavigationBarItem(icon: const Icon(Icons.trending_up_outlined)),
            DotNavigationBarItem(icon: const Icon(Icons.calendar_month)),
            DotNavigationBarItem(
                icon: InkWell(
                    onTap: () {
                      ConfirmAlertBoxDark(
                        onPressedYes: () async {
                          await LoginFunctionsProvider.logout();

                          if (!context.mounted) {
                            return;
                          }   //to avoid error while context is using in async function

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const ListenAuthChanges();
                          }));
                        },
                        context: context,
                        messageTextColor: Colors.white,
                        infoMessage: "Are you sure you want to log out ?",
                        title: " Are you sure you want to log out?",
                      );
                    },
                    child: const Icon(Icons.exit_to_app))),
          ],
        ),
      ),
    );
  }
}
