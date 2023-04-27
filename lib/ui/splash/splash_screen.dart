import 'package:flutter/material.dart';

import '../../model/user.dart';
import '../../utils/custom_colors.dart';
import '../../utils/routes.dart';
import '../../utils/var.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      dynamic user = Var.box.get(CollectionsDB.user.name);
      if (user != null) {
        user = user as User;
        Var.user = user;
        if (user.saveSession!) {
          Navigator.of(context).pushReplacementNamed(RoutePaths.home);
        } else {
          Navigator.of(context).pushReplacementNamed(RoutePaths.login);
        }
      } else {
        Navigator.of(context).pushReplacementNamed(RoutePaths.login);

        /*Var.user = User.testUser;
        Navigator.of(context).pushReplacementNamed(RoutePaths.home);*/
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/icon_app.png',
              alignment: Alignment.topCenter,
              fit: BoxFit.scaleDown,
              height: 128,
            ),
            const Text(
              'Activo Fijo',
              style: TextStyle(fontSize: 25),
            ),
            const CircularProgressIndicator(
                backgroundColor: CustomColors.dartMainColor),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
