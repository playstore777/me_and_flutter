/*
Not going to work, as I have used Provider with Firebase without SDK, to integrate
SDK version I have to remove that provider and also the available code/authentication
then, I have to implement my new Firebase SDK version, not just for authentication
but also for the backend as of now, we were doing it using http API(package).
so, now we don't need to use http for connecting with backend or authentication as FirebaseSDK does
it all alone.
Firebase SDK for flutter doesn't require any Provider package, as it does all the heavy lifting
of changes notification!
*/


// import 'package:flutter/material.dart';

// import 'package:firebase_auth/firebase_auth.dart';

// class AuthScreenSDK extends StatefulWidget {
//   @override
//   _AuthScreenSDKState createState() => _AuthScreenSDKState();
// }

// class _AuthScreenSDKState extends State<AuthScreenSDK> {
//   var _isLogin = true;
//   var _formKey = GlobalKey<FormState>();
//   var _credentialsMap = {
//     'email': '',
//     'password': '',
//   };

//   void _onSubmit() {
//     final _isValid = _formKey.currentState.validate();
//     if (!_isValid) return;
//     _formKey.currentState.save();
//     try {
//       if (_isLogin) {
//         FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: _credentialsMap['email'],
//           password: _credentialsMap['password'],
//         );
//       } else {
//         FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _credentialsMap['email'],
//           password: _credentialsMap['password'],
//         );
//       }
//     } catch (error) {
//       print('Error in _onSubmit of AuthScreen: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Authentication Screen'),
//       ),
//       body: Card(
//         child: Center(
//           child: Container(
//             width: size.width * 0.8,
//             height: size.height * 0.5,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         blurRadius: 5,
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(22),
//                     color: Colors.redAccent,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Text(
//                       _isLogin ? 'Login Mode' : 'Sign Up Mode',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 25,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: TextFormField(
//                           validator: (value) {
//                             if (value.isEmpty || !value.contains('@'))
//                               return 'Please enter a valid email';
//                             return null;
//                           },
//                           onSaved: (value) {
//                             if (value.isEmpty) return;
//                             _credentialsMap['email'] = value;
//                           },
//                           decoration: InputDecoration(
//                             labelText: 'Email Address',
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: TextFormField(
//                           validator: (value) {
//                             if (value.isEmpty || value.length < 7)
//                               return 'password lenght cannot be less than 7';
//                             return null;
//                           },
//                           onSaved: (value) {
//                             if (value.isEmpty) return;
//                             _credentialsMap['password'] = value;
//                           },
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             labelText: 'Password',
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: ElevatedButton(
//                           child: Text(
//                             _isLogin ? 'Login' : 'Sign Up',
//                           ),
//                           onPressed: _onSubmit,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(2.0),
//                         child: TextButton(
//                           child: Text(
//                               _isLogin ? 'Sign Up instead' : 'Login instead'),
//                           onPressed: () {
//                             setState(() {
//                               _isLogin = !_isLogin;
//                             });
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
