// import 'package:flutter/material.dart';

// import 'get_ballance.dart';

// class MyBallance extends StatelessWidget {
//   final MoralisService moralisService = MoralisService();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Moralis API in Flutter')),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () async {
//               try {
//                 await moralisService.getNativeBalance(
//                     '0x1', '0x9df19f2f103677baecb1f789a3723ffa73f4b3dd');
//               } catch (e) {
//                 print(e);
//               }
//             },
//             child: Text('Get Native Balance'),
//           ),
//         ),
//       ),
//     );
//   }
// }
