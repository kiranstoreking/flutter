// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: ProfilePage());
//   }
// }

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.white,
//       appBar: AppBar(title: Text('Profile'), backgroundColor: Colors.blue[700]),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // Profile Info Section
//               Container(
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.blue[700],
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Shubham Jaiswal',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       'CNC Programmer • Bengaluru • 2yr Exp',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       '+91 9347387349',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       'shubham1004@gmail.com',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Skills Collection Section
//               Container(
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.2),
//                       blurRadius: 6.0,
//                       offset: Offset(0.0, 2.0),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'My Skill Collection',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     ListTile(title: Text('UI/UX Design')),
//                     ListTile(title: Text('Fullstack Developer')),
//                     ListTile(title: Text('Marketing')),
//                     ListTile(title: Text('Illustration')),
//                     ListTile(title: Text('Product Design')),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),

//               // ATS Compliant Resume Section
//               Container(
//                 padding: const EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.green[300],
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'ATS Compliant Resume',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       'Our AI will help you create one.',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),

//               // My Activity Section
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'My Activity',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   ListTile(
//                     title: Text('Active Applications'),
//                     trailing: Icon(Icons.arrow_forward),
//                   ),
//                   ListTile(
//                     title: Text('Job Preferences'),
//                     trailing: Icon(Icons.arrow_forward),
//                   ),
//                   ListTile(
//                     title: Text('Enrolled Courses'),
//                     trailing: Icon(Icons.arrow_forward),
//                   ),
//                   ListTile(
//                     title: Text('Attended Webinars'),
//                     trailing: Icon(Icons.arrow_forward),
//                   ),
//                 ],
//               ),
//               Spacer(),

//               // General Section
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'General',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   ListTile(
//                     title: Text('Account settings'),
//                     trailing: Icon(Icons.arrow_forward),
//                   ),
//                   ListTile(
//                     title: Text('Help & Feedback'),
//                     trailing: Icon(Icons.arrow_forward),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),

//               // Logout Button
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle logout action
//                 },
//                 child: Text('Log out'),
//                 style: ElevatedButton.styleFrom(
//                   //                 primary: Colors.blue[700],
//                   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
