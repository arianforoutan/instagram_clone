import 'dart:ui';

import 'package:arigram/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/switch_account_background.png'),
                    ),
                  ),
                ),
                Positioned(
                  top: 235,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.5),
                              Color.fromRGBO(255, 255, 255, 0.2)
                            ],
                          ),
                        ),
                        height: 352,
                        width: 340,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 32),
                              child: Container(
                                height: 129,
                                width: 129,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/1.jpg'),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('ArianForoutan',
                                style: Theme.of(context).textTheme.headline4),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 46,
                              width: 129,
                              child: ElevatedButton(
                                style:
                                    Theme.of(context).elevatedButtonTheme.style,
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: ((context) {
                                    return MainScreen();
                                  })));
                                },
                                child: Text(
                                  'Confirm',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Text('switch account',
                                style: Theme.of(context).textTheme.headline4),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 132,
              bottom: 63,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account? / ',
                  style: TextStyle(
                      fontFamily: 'GB',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey[700]),
                ),
                Text(
                  'Sign up',
                  style: TextStyle(
                      fontFamily: 'GB',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
