import 'package:circular_menu/circular_menu.dart';
import 'package:dashboard_shox_shop/presentation/category/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:side_navigation/side_navigation.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final circularMenu = CircularMenu(items: [
    CircularMenuItem(
        icon: Icons.home,
        onTap: () {
          // callback
        }),
    CircularMenuItem(
        icon: Icons.search,
        onTap: () {
          //callback
        }),
    CircularMenuItem(
        icon: Icons.settings,
        onTap: () {
          //callback
        }),
    CircularMenuItem(
        icon: Icons.star,
        onTap: () {
          //callback
        }),
    CircularMenuItem(
        icon: Icons.pages,
        onTap: () {
          //callback
        })
  ]);
  var selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    List<Widget> views = [
      const Center(
        child: Text('Dashboard'),
      ),
      CategoryWidget(),
      const Center(
        child: Text('Dashboard'),
      ),
      const Center(
        child: Text('Account'),
      ),
      const Center(
        child: Text('Settings'),
      ),
    ];

    return Scaffold(
      body: Row(
        children: [
          /// Pretty similar to the BottomNavigationBar!
          SideNavigationBar(
            header: const SideNavigationBarHeader(
                image: CircleAvatar(
                  child: Icon(Icons.account_balance),
                ),
                title: Text('Shoxrux'),
                subtitle: Text('Yarashov')),
            footer: const SideNavigationBarFooter(label: Text('ShoxShop 2023')),
            selectedIndex: selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.dashboard,
                label: 'General',
              ),
              SideNavigationBarItem(
                icon: Icons.category,
                label: 'Category',
              ),
              SideNavigationBarItem(
                icon: Icons.sports_bar_rounded,
                label: 'Sub Category',
              ),
              SideNavigationBarItem(
                icon: Icons.carpenter,
                label: 'Product',
              ),
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Vendor',
              ),
              SideNavigationBarItem(
                icon: Icons.person_pin,
                label: 'User',
              ),
              SideNavigationBarItem(
                icon: Icons.ads_click,
                label: 'Banner',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),

          /// Make it take the rest of the available width
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
      floatingActionButton: circularMenu,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
