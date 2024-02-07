import'package:flutter/material.dart';


class MemberDetailsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Details'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 4,
                ),
              ),
              child: const CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage('assets/images/m.png'),
              ),
            ),
            const SizedBox(height: 10,),
            Text('Member Name: member.Name',style: TextStyle(fontWeight: FontWeight.bold),),
            Text('Membership Number:member.MembershipNumber',style: TextStyle(fontWeight: FontWeight.bold),),
            Text('Member Category:member.MemberCategory',style: TextStyle(fontWeight: FontWeight.bold),),
            Text('Status:member.Status',style: TextStyle(color: Colors.green),),

          ],
        ),
      ),
    );
  }
}

