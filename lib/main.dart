import 'package:flutter/material.dart';
import 'package:news/providers/userdata_providers.dart';
import 'package:provider/provider.dart';
import 'package:news/splash_screen.dart';
import 'drawer_screen/about_developer_screen.dart';
import 'drawer_screen/about_lcci.dart';
import 'drawer_screen/administrative_team_screen.dart';
import 'drawer_screen/emergency_number_screen.dart';
import 'drawer_screen/member_lists.dart';
import 'drawer_screen/organizational_team_screen.dart';
import 'drawer_screen/past_presidents_screen.dart';
import 'tabPages/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserDataProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
        '/splash': (context) => SplashScreen(),
        '/home': (context) => const HomePage(),
        '/past_presidents': (context) => PastPresidentsScreen(),
        '/member_list': (context) => MemberList(),
        '/organization_team': (context) => OrganizationTeamScreen(),
        '/administrative_team': (context) => AdministrativeTeamScreen(),
        '/emergency_number': (context) => EmergencyNumberScreen(),
        '/about_developer': (context) => AboutDeveloperScreen(),
        // '/log_out': (context) => Logout(),
        '/about_us': (context) => AboutLcci(),

      },
    );
  }
}
