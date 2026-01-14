// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';

// class FingerprintPage extends StatefulWidget {
//   const FingerprintPage({super.key});

//   @override
//   State<FingerprintPage> createState() => _FingerprintPageState();
// }

// class _FingerprintPageState extends State<FingerprintPage> {
//   final LocalAuthentication auth = LocalAuthentication();
//   String message = 'Not authenticated';

//   Future<void> authenticate() async {
//     try {
//       bool result = await auth.authenticate(
//         localizedReason: 'Scan your fingerprint',
//         options: const AuthenticationOptions(
//           biometricOnly: true,
//           stickyAuth: true,
//         ),
//       );

//       setState(() {
//         message = result ? 'Authenticated ' : 'Failed ';
//       });
//     } catch (e) {
//       setState(() {
//         message = 'Error ';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Fingerprint')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(Icons.fingerprint, size: 80),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: authenticate,
//               child: const Text('Authenticate'),
//             ),
//             const SizedBox(height: 20),
//             Text(message),
//           ],
//         ),
//       ),
//     );
//   }
// }
// // 
