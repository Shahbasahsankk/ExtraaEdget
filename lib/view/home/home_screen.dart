import 'package:flutter/material.dart';
import 'package:machine_task1/controller/exception_controller.dart';
import 'package:machine_task1/controller/home_controller.dart';
import 'package:machine_task1/view/home/widgets/all_rockets.dart';
import 'package:machine_task1/view/home/widgets/home_screen_shimmer.dart';
import 'package:machine_task1/view/home/widgets/prefered_appbar.dart';
import 'package:machine_task1/widgets/retry_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeController.getAllRockets();
    });
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(
            double.infinity,
            100,
          ),
          child: preferesSizeAppbar(),
        ),
        body: Consumer2<HomeController, ExceptionController>(
          builder: (context, values, eValues, _) {
            return values.loading
                ? homeShimmer()
                : values.internetStatus == false
                    ? const RetryWidget(
                        text: 'No Internet Connection', screen: 'Home')
                    : eValues.exception == 'ConectionError'
                        ? const RetryWidget(
                            text: 'Something went Wrong', screen: 'Home')
                        : eValues.exception == 'TimeError'
                            ? const RetryWidget(
                                text: 'Connection Timedout', screen: 'Home')
                            : eValues.exception == 'SendError'
                                ? const RetryWidget(
                                    text: 'Server Error', screen: 'Home')
                                : eValues.exception == 'CancelError'
                                    ? const RetryWidget(
                                        text: 'Connection Canceled',
                                        screen: 'Home',
                                      )
                                    : eValues.exception == 'BadError'
                                        ? const RetryWidget(
                                            text: 'Bad Connection',
                                            screen: 'Home',
                                          )
                                        : eValues.exception == 'InternetError'
                                            ? const RetryWidget(
                                                text: 'Connection Lost',
                                                screen: 'Home',
                                              )
                                            : allRockets(
                                                values.allRockets, values);
          },
        ),
      ),
    );
  }
}
