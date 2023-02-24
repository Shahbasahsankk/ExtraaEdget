import 'package:flutter/material.dart';

import '../../../widgets/skelton.dart';

Widget homeShimmer() {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8, top: 5),
    child: ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
          child: Row(
            children: [
              skelton(110, 100),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  skelton(20, 200),
                  const SizedBox(height: 15),
                  skelton(20, 200),
                  const SizedBox(height: 15),
                  skelton(20, 200),
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
      itemCount: 5,
    ),
  );
}
