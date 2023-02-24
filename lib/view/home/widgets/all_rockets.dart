import 'package:flutter/material.dart';
import 'package:machine_task1/model/all_rockets_model.dart';

import '../../../controller/home_controller.dart';

Widget allRockets(List<AllRocketsModel> allRockets, HomeController values) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8, top: 5),
    child: ListView.separated(
      itemBuilder: (context, index) {
        final int engineCount = allRockets[index].firstStage.engines +
            allRockets[index].secondStage.engines;
        return GestureDetector(
          onTap: () =>
              values.goToSingleRocketScreen(context, allRockets[index].id),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFBDB6B6),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            width: double.infinity,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(allRockets[index].flickrImages[0]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${allRockets[index].name}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Flexible(
                          child: Text(
                            'Country: ${allRockets[index].country}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          'Total engines: $engineCount',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
      itemCount: allRockets.length,
    ),
  );
}
