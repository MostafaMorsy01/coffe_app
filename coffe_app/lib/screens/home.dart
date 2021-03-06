import 'package:coffe_app/screens/signup.dart';
import 'package:coffe_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../coffe_router.dart';
import 'login.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'homeScreen';
  static Route<HomeScreen> route() {
    return MaterialPageRoute<HomeScreen>(
      settings: RouteSettings(name: routeName),
      builder: (BuildContext context) => HomeScreen(),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final registerScaffoldKey = GlobalKey<ScaffoldState>();
  final loginScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(
              "assets/logo.png",
              height: 150,
              width: 150,
            ),
            SvgPicture.asset(
              "assets/hangout.svg",
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              semanticsLabel: 'Wired Brain Coffee',
              fit: BoxFit.fitWidth,
            ),
            Text(
              "Get the best coffee!",
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CommonButton(
                  onPressed: () {
                    CoffeeRouter.instance.push(
                      RegisterScreen.route(registerScaffoldKey),
                    );
                  },
                  text: 'Register',
                  highlighColor: true,
                ),
                SizedBox(
                  width: 20,
                ),
                CommonButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      LoginScreen.route(loginScaffoldKey),
                    );
                  },
                  text: 'Log In',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
