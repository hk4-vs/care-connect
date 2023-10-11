import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleCardWidget extends StatelessWidget {
  const ScheduleCardWidget({
    super.key,
   
  });

 

  @override
  Widget build(BuildContext context) {
     final DateTime now = DateTime.now();
    final String todaysDate = DateFormat('EEEE, d MMMM').format(now);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.80),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/nurse_image.jpg"),
            ),
            title: Text(
              "Dr. Bharti Sharma",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Dentist Consultantion",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColorLight,
                    )),
            trailing: Container(
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.only(left: 6),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColorLight),
                child: Icon(
                  CupertinoIcons.phone_fill,
                  color: Theme.of(context).primaryColor,
                )),
          ),
          Container(
            height: 60,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12)),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Row(
                children: [
                  Icon(CupertinoIcons.calendar_today,
                      color: Theme.of(context).primaryColorLight),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(todaysDate,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).primaryColorLight,
                          ))
                ],
              ),
              VerticalDivider(
                color: Theme.of(context).primaryColorLight.withOpacity(0.3),
                thickness: 2,
              ),
              Row(
                children: [
                  Icon(CupertinoIcons.time,
                      color: Theme.of(context).primaryColorLight),
                  const SizedBox(
                    width: 6,
                  ),
                  Text("09:00-10:00",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).primaryColorLight,
                          ))
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
