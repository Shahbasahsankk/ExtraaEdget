import 'package:flutter/material.dart';
import 'package:machine_task1/controller/exception_controller.dart';
import 'package:machine_task1/controller/single_rocket_controller.dart';
import 'package:machine_task1/view/rocket_screen/widgets/rocket_details.dart';
import 'package:machine_task1/view/rocket_screen/widgets/rocket_shimmer.dart';
import 'package:machine_task1/widgets/retry_widget.dart';
import 'package:provider/provider.dart';

class RocketScreen extends StatelessWidget {
  const RocketScreen({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    final rocketController =
        Provider.of<SingleRocketController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      rocketController.getRocket(id);
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Consumer2<SingleRocketController, ExceptionController>(
          builder: (context, values, eValues, _) {
            return values.loading
                ? rocketShimmer()
                : values.internetStatus == false
                    ? const RetryWidget(
                        text: 'No Internet Connection',
                        screen: 'RocketScreen',
                      )
                    : eValues.exception == 'ConectionError'
                        ? RetryWidget(
                            text: 'Something went Wrong',
                            screen: 'rocket',
                            id: id,
                          )
                        : eValues.exception == 'TimeError'
                            ? RetryWidget(
                                text: 'Connection Timedout',
                                screen: 'rocket',
                                id: id,
                              )
                            : eValues.exception == 'SendError'
                                ? RetryWidget(
                                    text: 'Server Error',
                                    screen: 'rocket',
                                    id: id,
                                  )
                                : eValues.exception == 'CancelError'
                                    ? RetryWidget(
                                        text: 'Connection Canceled',
                                        screen: 'rocket',
                                        id: id,
                                      )
                                    : eValues.exception == 'BadError'
                                        ? RetryWidget(
                                            text: 'Bad Connection',
                                            screen: 'rocket',
                                            id: id,
                                          )
                                        : eValues.exception == 'InternetError'
                                            ? RetryWidget(
                                                text: 'Connection Lost',
                                                screen: 'rocket',
                                                id: id,
                                              )
                                            : rocketDetails(
                                                values.rocket!,
                                                () => values.launchWikipidea(
                                                    values.rocket!.wikipedia),
                                              );
          },
        ),
      ),
    );
  }
}
