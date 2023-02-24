import 'package:flutter/material.dart';
import 'package:machine_task1/controller/exception_controller.dart';
import 'package:machine_task1/controller/home_controller.dart';
import 'package:machine_task1/controller/single_rocket_controller.dart';
import 'package:provider/provider.dart';

class RetryWidget extends StatelessWidget {
  const RetryWidget({
    super.key,
    required this.text,
    required this.screen,
    this.id,
  });
  final String text;
  final String? screen;
  final String? id;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.black26),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () => {
                  context.read<ExceptionController>().clearException(),
                  screen == 'Home'
                      ? context.read<HomeController>().getAllRockets()
                      : context.read<SingleRocketController>().getRocket(id!)
                },
                child: Container(
                  height: 28,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text(
                      'Retry',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
