import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/globals.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController _pageController;

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    //get the user name
    // user_model.User user = Provider.of<UserProvider>(context).getUser!;
    return Scaffold(
      body: PageView(
        children: homeScreenLayouts,
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Color.fromARGB(255, 49, 0, 163),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.home,
                color: _page == 0 ? Colors.white : Colors.black,
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.manage_accounts,
                color: _page == 1 ? Colors.white : Colors.black,
              ),
            ),
            label: "",
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
