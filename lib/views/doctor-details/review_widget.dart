import 'package:care_connect/resources/data/data.dart';
import 'package:care_connect/views/doctor-details/customer_review_widget.dart';
import 'package:flutter/material.dart';


class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              "Reviews",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Expanded(child: Container()),
            Icon(Icons.drive_file_rename_outline,
                color: Theme.of(context).primaryColor),
            Text(
              "add review",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          decoration: InputDecoration(
              prefixIcon:
                  Icon(Icons.search, color: Theme.of(context).primaryColor),
              hintText: "Search in reviews"),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 30,
          width: double.maxFinite,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: DataClass.filterList.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: FilterName(
                    filterName: DataClass.filterList[index],
                    color: Theme.of(context).primaryColor,
                  ),
                );
              }),
        ),
        Divider(
            thickness: 2,
            color: Theme.of(context).disabledColor.withOpacity(0.2)),
        for (int i = 0; i < DataClass.reviewList.length; i++) ...[
          CustomerReviewWidget(
              custmorName: DataClass.reviewList[i]['name'],
              image: DataClass.reviewList[i]['image'],
              review: DataClass.reviewList[i]['review'],
              rating: DataClass.reviewList[i]['rating'].toString(),
              reviewDate: DataClass.reviewList[i]['review_month']),
        ],
      ],
    );
  }
}

class FilterName extends StatelessWidget {
  const FilterName({super.key, required this.filterName, required this.color});
  final String filterName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: color,
          border: Border.all(
            color: Theme.of(context).disabledColor,
          )),
      child: Text(
        filterName,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).primaryColorLight,
            ),
      ),
    );
  }
}
