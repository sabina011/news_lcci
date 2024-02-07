import 'package:flutter/material.dart';

import '../drawer_screen/more_info_screen.dart';
import '../tabPages/home_page.dart';


class LoggedOutDrawer extends StatelessWidget {
  LoggedOutDrawer({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Past Presidents', 'icon': Icons.star, 'route': '/past_presidents', 'description': 'Description for Past Presidents'},
    {'title': 'Organization Team', 'icon': Icons.group, 'route': '/organization_team', 'description': 'Description for Organization Team'},
    {'title': 'Administrative team', 'icon': Icons.business, 'route': '/administrative_team', 'description': 'Description for Administrative Team'},
    {'title': 'Emergency number', 'icon': Icons.phone, 'route': '/emergency_number', 'description': 'Description for Emergency Number'},
    {'title': 'About Developer', 'icon': Icons.developer_mode, 'route': '/about_developer', 'description': 'Description for About Developer'},
    {'title': 'About LCCI','route': '/about_us','icon':Icons.bookmark,'description':'Know about the app'},
    {'title' : 'Log Out','icon':Icons.logout,'route': '/log_out', 'description': 'Logout from the app'},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MoreInfoScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/m.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text('Hari Prasad Acharya',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          for (var item in menuItems)
            ListTile(
              onTap: () {
                if (item['route'] == '/log_out') {
                  showLogoutConfirmationDialog(context);
                } else {
                  Navigator.pushNamed(context, item['route']);
                }
              },
              leading: Icon(
                item['icon'],
                size: 30,
                color: Colors.black,
              ),
              title: Text(
                item['title'],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: item['description'] != null
                  ? Text(item['description'])
                  : null,
            ),
        ],
      ),
    );
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Logout Confirmation',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text('Are you sure you want to log out?'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      performLogout(context);
                    },
                    child: Text('Yes'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('No'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void performLogout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }


}

