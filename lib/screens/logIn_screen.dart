// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import '../widgets/auth_vm.dart';

// class LogInScreen extends StatefulWidget {
//   @override
//   State<LogInScreen> createState() => _LogInScreenState();
// }

// class _LogInScreenState extends State<LogInScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();

//     super.dispose();
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return SingleChildScrollView(
//   //     padding: EdgeInsets.all(15),
//   //     child: Column(
//   //       mainAxisAlignment: MainAxisAlignment.center,
//   //       children: [
//   //         SizedBox(
//   //           height: 40,
//   //         ),
//   //         TextField(
//   //           controller: emailController,
//   //           cursorColor: Colors.white,
//   //           textInputAction: TextInputAction.next,
//   //           decoration: InputDecoration(labelText: "Email"),
//   //         ),
//   //         SizedBox(
//   //           height: 5,
//   //         ),
//   //         TextField(
//   //           controller: passwordController,
//   //           textInputAction: TextInputAction.done,
//   //           decoration: InputDecoration(labelText: "Password"),
//   //           obscureText: true,
//   //         ),
//   //         SizedBox(
//   //           height: 20,
//   //         ),
//   //         ElevatedButton.icon(
//   //           onPressed: signIn,
//   //           icon: Icon(Icons.lock_open, size: 32),
//   //           label: Text(
//   //             "Sign In",
//   //             style: TextStyle(fontSize: 24),
//   //           ),
//   //           style: ElevatedButton.styleFrom(
//   //             minimumSize: Size.fromHeight(45),
//   //           ),
//   //         )
//   //       ],
//   //     ),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       body: LogInVM(),
//     );
//   }

//   Future signIn() async {
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim());
//   }
// }
