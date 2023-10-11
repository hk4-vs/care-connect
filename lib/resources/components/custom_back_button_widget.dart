import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBackButtonWidget extends StatelessWidget {
  const CustomBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Theme.of(context).disabledColor.withOpacity(0.5)),
        ),
        child: Icon(
          CupertinoIcons.arrow_left,
          color: Theme.of(context).primaryColorDark,
        ),
      ),
    );
  }
}
