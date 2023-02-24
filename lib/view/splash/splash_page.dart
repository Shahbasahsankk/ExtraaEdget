import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:machine_task1/controller/splash_controller.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController =
        Provider.of<SplashController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      splashController.splash(context);
    });
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2,
                    color: Colors.black,
                    child: Column(
                      children: const [
                        SizedBox(height: 120),
                        Image(
                          width: 300,
                          image: AssetImage('assets/spaceX.jpg'),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3,
                  color: Colors.white54,
                  child: const SpinKitThreeBounce(
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 130),
              child: Image(
                image: AssetImage('assets/rocket.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
