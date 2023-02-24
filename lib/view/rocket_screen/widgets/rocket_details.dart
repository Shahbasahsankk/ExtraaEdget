import 'package:flutter/material.dart';
import 'package:machine_task1/model/single_rocket_model.dart';
import 'package:machine_task1/view/rocket_screen/widgets/richtext.dart';

Widget rocketDetails(SingleRocketModel rocket, void Function()? onTap) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        rocket.name,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: SizedBox(
          height: 230,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                width: 230,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      rocket.flickrImages[index],
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemCount: rocket.flickrImages.length,
          ),
        ),
      ),
      const SizedBox(height: 10),
      Expanded(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRichText(text1: 'Description', text2: rocket.description),
                const SizedBox(height: 5),
                CustomRichText(
                    text1: 'Active Status', text2: rocket.active.toString()),
                const SizedBox(height: 5),
                CustomRichText(
                    text1: 'Cost per launch',
                    text2: rocket.costPerLaunch.toString()),
                const SizedBox(height: 5),
                CustomRichText(
                    text1: 'Success rate', text2: '${rocket.successRatePct} %'),
                const SizedBox(height: 5),
                CustomRichText(
                    text1: 'Wikipidea link',
                    text2: rocket.wikipedia,
                    onTap: onTap),
                const SizedBox(height: 5),
                CustomRichText(
                    text1: 'Height', text2: '${rocket.height.feet} Feet'),
                const SizedBox(height: 5),
                CustomRichText(
                    text1: 'Diameter', text2: '${rocket.diameter.feet} Feet'),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
