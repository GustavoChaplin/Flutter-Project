import 'package:flutter/material.dart';
import 'package:flutterproject/states/user_state.dart';

class UserPage extends StatelessWidget {
  final UserState userState = UserState();

  UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
      ),
      body: Center(
        child: Table(
          children: [
            TableRow(
              children: [
                Wrap(
                  direction: Axis.vertical,
                  spacing: 20,
                  children: [
                    Text('Overview'),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('Current Balance'),
                            Text('4199.00'),
                          ]
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('Income'),
                            Text('4199.00'),
                          ]
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('Expenses'),
                            Text('4199.00'),
                          ]
                        ),
                      ),
                    )
                  ]
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}