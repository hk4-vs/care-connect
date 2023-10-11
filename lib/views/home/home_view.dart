import 'package:care_connect/resources/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/components/app_title_widget.dart';
import '../../resources/components/category_widget.dart';
import '../../resources/components/doctor_card_widget.dart';
import '../../resources/components/hospital_card_widget.dart';
import '../../resources/components/schedule_card_widget.dart';
import 'home_appbar_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map> hospitalData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 60,
            ),
            const HomeAppbarWidget(),
            const SizedBox(
              height: 20,
            ),
            searchFieldWidget(context),
            const SizedBox(
              height: 20,
            ),
            const AppTitleWidget(
              title: "Upcomming Schedule",
              bacthString: "4",
            ),
            const SizedBox(
              height: 20,
            ),
            const ScheduleCardWidget(),
            const SizedBox(
              height: 20,
            ),
            const AppTitleWidget(
              title: "Doctor Speciality",
            ),
            const SizedBox(
              height: 10,
            ),
            const CategoryWidget(),
            const SizedBox(
              height: 20,
            ),
            const AppTitleWidget(
              title: "Nearby Hospital",
            ),
            const SizedBox(
              height: 10,
            ),

            // There is start Hospital card Widget
            SizedBox(
              height: 220,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: DataClass.hospitalData.length,
                  itemBuilder: (context, index) {
                    return HospitalCardWidget(
                      name: DataClass.hospitalData[index]["name"],
                      time: DataClass.hospitalData[index]["time"],
                      image: DataClass.hospitalData[index]["image"],
                      distence: DataClass.hospitalData[index]["distance"],
                      rating: DataClass.hospitalData[index]["rating"],
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),

            // Top Spacialist
            const AppTitleWidget(
              title: "Top Spacialist",
            ),
            const SizedBox(
              height: 10,
            ),
            for (int i = 0; i < DataClass.doctorData.length; i++) ...[
              DoctorCardWidget(
                  name: DataClass.doctorData[i]['name'],
                  image: DataClass.doctorData[i]['image'],
                  rating: DataClass.doctorData[i]['rating'],
                  reviews: DataClass.doctorData[i]['reviews'],
                  spacialist: DataClass.doctorData[i]['spacialist'])
            ],

            // Spacer is here
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    ));
  }

  Row searchFieldWidget(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width - 120,
          child: const TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.search), hintText: "Search"),
          ),
        ),
        const Spacer(),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).primaryColor),
          child: Icon(
            CupertinoIcons.slider_horizontal_3,
            color: Theme.of(context).primaryColorLight,
          ),
        )
      ],
    );
  }
}
