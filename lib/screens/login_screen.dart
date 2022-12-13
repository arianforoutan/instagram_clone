import 'package:arigram/screens/switch_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode negahdar1 = FocusNode();
  FocusNode negahdar2 = FocusNode();
  @override
  void initState() {
    negahdar1.addListener(() {
      setState(() {});
    });

    negahdar2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff323A99),
            Color(0xffF98BFC),
          ],
        ),
      ),
      child: Scaffold(
        // resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getImageContainer(),
            _getTwoContainer(),
          ],
        ),
      ),
    );
  }

  Widget _getTwoContainer() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.2,
            decoration: BoxDecoration(
              color: Color(0xff1C1F2E),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in to ',
                      style: TextStyle(
                          fontFamily: 'GB',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Image(
                      image: AssetImage('images/mood.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 36,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    focusNode: negahdar1,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 18,
                        color: negahdar1.hasFocus
                            ? Color(0xffF35383)
                            : Color(0xffC5C5C5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0xffC5C5C5),
                          width: 3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 3,
                          color: Color(0xffF35383),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    focusNode: negahdar2,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 18,
                        color: negahdar2.hasFocus
                            ? Color(0xffF35383)
                            : Color(0xffC5C5C5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: Color(0xffC5C5C5),
                          width: 3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 3,
                          color: Color(0xffF35383),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: ((context) {
                      return SwitchAccountScreen();
                    })));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 13),
                    child: Text('Sign in'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getImageContainer() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 30,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Image(
              image: AssetImage('images/rocket.png'),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    negahdar1.dispose();
    negahdar2.dispose();

    super.dispose();
  }
}
