import 'package:flutter/material.dart';
import 'package:news/drawer_screen/past_presidents_screen.dart';

import '../tabPages/home_page.dart';
import 'about_developer_screen.dart';
import 'about_lcci.dart';
import 'administrative_team_screen.dart';
import 'emergency_number_screen.dart';
import 'member_lists.dart';
import 'organizational_team_screen.dart';
class LoggedInDrawer extends StatelessWidget {
  LoggedInDrawer({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'Past Presidents',
      'icon': Icons.star,
      'route': '/past_presidents',
      'description': 'Description for Past Presidents'
    },
    {
      'title': 'Members Lists',
      'icon': Icons.card_membership,
      'route': '/member_list',
      'description': 'Descriptions regarding to the Member and organization list',
    },
    {
      'title': 'Organization Team',
      'icon': Icons.group,
      'route': '/organization_team',
      'description': 'Description for Organization Team'
    },
    {
      'title': 'Administrative team',
      'icon': Icons.business,
      'route': '/administrative_team',
      'description': 'Description for Administrative Team'
    },
    {
      'title': 'Emergency number',
      'icon': Icons.phone,
      'route': '/emergency_number',
      'description': 'Description for Emergency Number'
    },
    {
      'title': 'About Developer',
      'icon': Icons.developer_mode,
      'route': '/about_developer',
      'description': 'Description for About Developer'
    },
    {
      'title': 'About LCCI',
      'route': '/about_us',
      'icon': Icons.bookmark,
      'description': 'Know about the app'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/logo_t.png',
                      width: 70,
                      height: 70,
                    ),
                  ),
                  Center(
                    child: Text(
                      'LEKHNATH CHAMBER OF COMMERCE AND INDUSTRY',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Add your menu items here
          buildMenuItems(context),
        ],
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Column(
      children: menuItems.map((item) {
        return ListTile(
          onTap: () {
            _navigateToPage(context, item['route']);
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
        );
      }).toList(),
    );
  }

  void _navigateToPage(BuildContext context, String? route) {
    switch (route) {
      case '/past_presidents':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PastPresidentsScreen()));
        break;
      case '/member_list':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MemberList()));
        break;
      case '/organization_team':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OrganizationTeamScreen()));
        break;
      case '/administrative_team':
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => AdministrativeTeamScreen()));
        break;
      case '/emergency_number':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EmergencyNumberScreen()));
        break;
      case '/about_developer':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AboutDeveloperScreen()));
        break;
      case '/about_us':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AboutLcci()));
        break;
      default:
      // Handle if route is not found
        break;
    }
  }

//
// class LoggedInDrawerWithProvider extends StatelessWidget {
//   LoggedInDrawerWithProvider({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final userDataProvider = Provider.of<UserDataProvider>(context);
//     final userData = userDataProvider.userData;
//
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             decoration: BoxDecoration(),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   userData != null && userData['full_name'] != null
//                       ? Column(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => MoreInfoScreen(
//
//                               ),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                               color: Colors.white,
//                               width: 4,
//                             ),
//                           ),
//                           child: const CircleAvatar(
//                             radius: 45,
//                             backgroundImage: AssetImage('assets/images/m.png'),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(userData['full_name'] as String,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   )
//                       : Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                        children: [
//                       Image.asset(
//                         'assets/images/logo_t.png',
//                         width: 70,
//                         height: 70,
//                       ),
//                       Text('LEKHNATH CHAMBER OF COMMERCE AND INDUSTRY',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Add your menu items here
//           buildMenuItems(context),
//           ListTile(
//             onTap: () {
//               showLogoutConfirmationDialog(context);
//             },
//             leading: const Icon(
//               Icons.logout,
//               size: 30,
//               color: Colors.black,
//             ),
//             title: const Text(
//               'Log Out',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             subtitle: Text('Logout from the app'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void showLogoutConfirmationDialog(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 'Logout Confirmation',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Text('Are you sure you want to log out?'),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                       performLogout(context);
//                     },
//                     child: Text('Yes'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text('No'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void performLogout(BuildContext context) {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => HomePage()),
//     );
//   }
//
//   Widget buildMenuItems(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           onTap: () {
//             Navigator.pushNamed(context, '/past_presidents');
//           },
//           leading: Icon(
//             Icons.star,
//             size: 30,
//             color: Colors.black,
//           ),
//           title: Text(
//             'Past Presidents',
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           subtitle: Text('Description for Past Presidents'),
//         ),
//         ListTile(
//           onTap: () {
//             Navigator.pushNamed(context, '/member_list');
//           },
//           leading: Icon(
//             Icons.card_membership,
//             size: 30,
//             color: Colors.black,
//           ),
//           title: Text(
//             'Member List',
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           subtitle: Text('Description for Member List'),
//         ),
//         ListTile(
//           onTap: () {
//             Navigator.pushNamed(context, '/organization_team');
//           },
//           leading: Icon(
//             Icons.groups_sharp,
//             size: 30,
//             color: Colors.black,
//           ),
//           title: Text(
//             'Organization Team',
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           subtitle: Text('Description for Organizational Team'),
//         ),
//         ListTile(
//           onTap: () {
//             Navigator.pushNamed(context,'/administrative_team');
//           },
//           leading: Icon(
//             Icons.groups,
//             size: 30,
//             color: Colors.black,
//           ),
//           title: Text(
//             'Administrative Team',
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           subtitle: Text('Description for Administrative Team'),
//         ),
//         ListTile(
//           onTap: () {
//             Navigator.pushNamed(context, '/emergency_number');
//           },
//           leading: Icon(
//             Icons.numbers,
//             size: 30,
//             color: Colors.black,
//           ),
//           title: Text(
//             'Emergency Number',
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           subtitle: Text('Emergency Number of LCCI'),
//         ),
//         ListTile(
//           onTap: () {
//             Navigator.pushNamed(context, '/about_developer');
//           },
//           leading: Icon(
//             Icons.person,
//             size: 30,
//             color: Colors.black,
//           ),
//           title: Text(
//             'About Developers',
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           subtitle: Text('Description for Developers'),
//         ),
//         ListTile(
//           onTap: () {
//             Navigator.pushNamed(context, '/about_us');
//           },
//           leading: Icon(
//             Icons.account_box_outlined,
//             size: 30,
//             color: Colors.black,
//           ),
//           title: Text(
//             'About LCCI',
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           subtitle: Text('Know More about LCCI'),
//         ),
//
//       ],
//     );
//   }
// }
}