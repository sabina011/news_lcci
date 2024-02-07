import'package:flutter/material.dart';
import '../drawer_screen/drawers.dart';
import '../tabPages/local_products.dart';
import '../tabPages/news_page.dart';
import '../tabPages/notice.dart';
import '../tabPages/sites_page.dart';
import 'memeberevent.dart';

 class HomePageAfterLogin extends StatefulWidget {
   const HomePageAfterLogin({super.key});

   @override
   State<HomePageAfterLogin> createState() => _HomePageAfterLoginState();
 }

 class _HomePageAfterLoginState extends State<HomePageAfterLogin> {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: ThemeData.light(useMaterial3: true),
       home: DefaultTabController(
         length: 5,
         child: SafeArea(
           child: Scaffold(
             appBar: AppBar(
               primary: true,
               centerTitle: false,
               titleSpacing: 0.0,
               title: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Image.asset(
                     'assets/images/logo_t.png',
                     width: 70,
                     height: 70,
                   ),
                   const SizedBox(width: 16),
                 ],
               ),
               iconTheme: const IconThemeData(color: Colors.grey),
               bottom: const PreferredSize(
                 preferredSize: Size.fromHeight(80.0),
                 child: TabBar(
                   tabs: [
                     Tab(
                       child: Text(
                         'NEWS',
                         style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                       ),
                     ),
                     Tab(
                       child: Text(
                         'NOTICES',
                         style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                       ),
                     ),
                     Tab(
                       child: Text(
                         'EVENTS',
                         style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                       ),
                     ),
                     Tab(
                       child: Text(
                         'SITES',
                         style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                       ),
                     ),
                     Tab(
                       child: Text(
                         'PRODUCTS',
                         style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
             drawer:  LoggedInDrawer(),
             body: const Padding(
               padding: EdgeInsets.symmetric(vertical: 24),
               child: TabBarView(
                 children: [
                   NewsScreen(),
                   NoticeScreen(),
                   MemberEventScreen(),
                   Sites(),
                   LocalProducts(),
                 ],
               ),
             ),
           ),
         ),
       ),
     );
   }
 }

