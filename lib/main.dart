import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Set the app's primary theme color
        primarySwatch: Colors.green,
      ),
      // Disable the debug banner
      debugShowCheckedModeBanner: false,

      // Set the FirstScreen as the initial screen
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Set the app bar title
        title: const Text('First Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              // Provide a unique tag for the Hero widget
              tag: 'Screen 1',
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      // Navigate to the SecondScreen
                      return SecondScreen();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        // Apply slide transition
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              // Button to navigate to the SecondScreen
              child: Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Set the app bar title
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              // Provide a unique tag for the Hero widget
              tag: 'Screen 1',
              child: Container(
                width: 200,
                height: 200,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
