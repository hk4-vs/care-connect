import 'package:care_connect/resources/components/app_title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/components/custom_back_button_widget.dart';
import '../../resources/components/custom_bottom_button_widget.dart';

class SelectPackageView extends StatefulWidget {
  const SelectPackageView({super.key});

  @override
  State<SelectPackageView> createState() => _SelectPackageViewState();
}

class _SelectPackageViewState extends State<SelectPackageView> {
  List<int> timeIntervals = List.generate(12, (index) => (index + 1) * 5);
  int selectedTimeInterval = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Row(
          children: [
            Spacer(),
            CustomBackButtonWidget(),
          ],
        ),
        title: Text(
          "Select Package",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar:
          CustomBottomButtonWidget(text: "Next", funcation: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 40,
            ),
            const AppTitleWidget(
              title: "Select Duration",
              isSeeAll: false,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: InputDecorator(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.timer,
                      color: Theme.of(context).primaryColor,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2, horizontal: 20)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    padding: EdgeInsets.zero,
                    menuMaxHeight: 300,
                    icon: Icon(
                      CupertinoIcons.chevron_down,
                      color: Theme.of(context).primaryColor,
                    ),
                    value: selectedTimeInterval,
                    onChanged: (value) {
                      setState(() {
                        selectedTimeInterval = value!;
                      });
                    },
                    items: timeIntervals.map((time) {
                      return DropdownMenuItem<int>(
                        value: time,
                        child: Text('$time minutes'),
                      );
                    }).toList(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
