import 'package:arigram/screens/Home_screen.dart';
import 'package:arigram/screens/activity_screen.dart';
import 'package:arigram/screens/add_content_scrreen.dart';
import 'package:arigram/screens/login_screen.dart';
import 'package:arigram/screens/main_screen.dart';
import 'package:arigram/screens/searchscreen.dart';
import 'package:arigram/screens/switch_account.dart';
import 'package:arigram/screens/user_profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline4: TextStyle(
              fontFamily: 'GB',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: TextStyle(
              fontFamily: 'GB',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage('images/pattern1.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Color(0xff1C1F2E),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Center(
              child: Container(
                width: 170,
                height: 85,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return LoginScreen();
                    })));
                  },
                  child: Image(
                    image: AssetImage('images/logo_splash.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              child: Column(
                children: [
                  Text(
                    'from ',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'ArianForoutan ',
                    style: TextStyle(
                        color: Colors.pink, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
