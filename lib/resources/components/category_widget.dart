import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // IconData iconData = IconData(codePoint)
    List<Map> categoryData = [
      {"title": "Dentist", "icon": FontAwesomeIcons.tooth},
      {"title": "Cardiology", "icon": FontAwesomeIcons.heartPulse},
      {"title": "Orthopedic", "icon": FontAwesomeIcons.stethoscope},
      {"title": "Neurology", "icon": FontAwesomeIcons.brain},
      {"title": "Dentist", "icon": FontAwesomeIcons.tooth},
      {"title": "Dentist", "icon": FontAwesomeIcons.tooth},
    ];
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryData.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor.withOpacity(0.3)),
                    child: Icon(
                      categoryData[index]['icon'] as IconData,
                      color: Theme.of(context).primaryColor,
                      size: 30,
                    )),
                SizedBox(
                  width: 60,
                  child: Center(
                    child: Text(
                      categoryData[index]['title'].toString(),
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
