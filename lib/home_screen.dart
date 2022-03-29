import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ham"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Quiz',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
            const Text(
              'By Saengsorn Wongpriew 623040395-5',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 19,
              ),
            ),
            Container(
              height: 100,
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: const Text('Start!'),
                onPressed: () => {
                  Navigator.pushNamed(context, '/another'),
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}