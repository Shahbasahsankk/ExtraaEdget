import 'package:flutter/material.dart';
import 'package:machine_task1/widgets/skelton.dart';

Widget rocketShimmer() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      skelton(25, 100),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: SizedBox(
          height: 230,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return skelton(230, 230);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemCount: 2,
          ),
        ),
      ),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            skelton(10, 300),
            const SizedBox(height: 2),
            skelton(10, 300),
            const SizedBox(height: 2),
            skelton(10, 300),
            const SizedBox(height: 2),
            skelton(10, 300),
            const SizedBox(height: 2),
            skelton(10, 300),
            const SizedBox(height: 2),
            skelton(10, 300),
            const SizedBox(height: 8),
            skelton(10, 230),
            const SizedBox(height: 8),
            skelton(10, 230),
            const SizedBox(height: 8),
            skelton(10, 230),
            const SizedBox(height: 8),
            skelton(10, 230),
            const SizedBox(height: 8),
            skelton(10, 230),
            const SizedBox(height: 8),
            skelton(10, 230),
          ],
        ),
      ),
    ],
  );
}
