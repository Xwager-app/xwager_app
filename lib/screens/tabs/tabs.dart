import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xwager/data/navigation_items.dart';
import 'package:xwager/screens/tabs/history.dart';
import 'package:xwager/screens/tabs/home.dart';
import 'package:xwager/screens/tabs/profile.dart';
import 'package:xwager/screens/tabs/wallet.dart';
import 'package:xwager/screens/tabs/xwager.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const HomeScreen();
    String? activePageTitle;

    if (_selectedPageIndex == 1) {
      activePage = const XwagerScreen();
      activePageTitle = 'Create New Xwager';
    }

    if (_selectedPageIndex == 2) {
      activePage = const HistoryScreen();
      activePageTitle = 'History';
    }

    if (_selectedPageIndex == 3) {
      activePage = const WalletScreen();
      activePageTitle = 'wallet';
    }

    if (_selectedPageIndex == 4) {
      activePage = const ProfileScreen();
      activePageTitle = 'Profile';
    }

    return Scaffold(
      appBar: activePageTitle == null
          ? null
          : AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              title: Text(
                activePageTitle,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              // leading: IconButton(
              //   style: IconButton.styleFrom(
              //     foregroundColor: const Color.fromRGBO(39, 67, 253, 1),
              //     backgroundColor: const Color.fromRGBO(245, 244, 248, 1),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //   ),
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   icon: const Icon(Icons.arrow_back),
              // ),
            ),
      body: activePage,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
            selectedItemColor: Theme.of(context).colorScheme.onPrimary,
            unselectedItemColor: const Color.fromRGBO(157, 155, 155, 1),
            selectedLabelStyle: GoogleFonts.jost(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w500),
            backgroundColor: Colors.white,
            currentIndex: _selectedPageIndex,
            onTap: _selectPage,
            // type: BottomNavigationBarType.fixed,
            items: [
              for (final item in navigationItems)
                BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    activeIcon:
                        // Transform.scale(
                        //   scale: 1.15,
                        Image.asset(item.icon,
                            color: Theme.of(context).colorScheme.onPrimary),
                    // ),
                    icon: Image.asset(
                      item.icon,
                      color: const Color.fromRGBO(157, 155, 155, 1),
                      width: 24,
                      height: 24,
                    ),
                    label: item.label),
            ]),
      ),
    );
  }
}
