import 'package:care_connect/resources/components/app_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../resources/components/custom_back_button_widget.dart';

class PaymentMethodsView extends StatefulWidget {
  const PaymentMethodsView({super.key});

  @override
  State<PaymentMethodsView> createState() => _PaymentMethodsViewState();
}

class _PaymentMethodsViewState extends State<PaymentMethodsView> {
  String paymentMethod = "card";
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
          "Payment Methods",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const AppTitleWidget(
              title: "Credit & Debit Card",
              isSeeAll: false,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5,
                      color: Theme.of(context).disabledColor.withOpacity(0.6)),
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                visualDensity: VisualDensity.standard,
                onTap: () {
                  setState(() {
                    paymentMethod = "card";
                  });
                },
                title: Text(
                  "Add New Card",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).disabledColor),
                ),
                leading: Icon(
                  FontAwesomeIcons.creditCard,
                  color: Theme.of(context).primaryColor,
                ),
                trailing: Radio(
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = value!;
                    });
                  },
                  value: "card",
                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const AppTitleWidget(
              title: "More Payment Options",
              isSeeAll: false,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5,
                      color: Theme.of(context).disabledColor.withOpacity(0.6)),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: ListTile(
                visualDensity: VisualDensity.standard,
                onTap: () {
                  setState(() {
                    paymentMethod = "paypal";
                  });
                },
                title: Text(
                  "Paypal",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).disabledColor),
                ),
                leading: Icon(
                  FontAwesomeIcons.paypal,
                  color: Theme.of(context).primaryColor,
                ),
                trailing: Radio(
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = value!;
                    });
                  },
                  value: "paypal",
                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 0.5,
                      color: Theme.of(context).disabledColor.withOpacity(0.6)),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: ListTile(
                visualDensity: VisualDensity.standard,
                onTap: () {
                  setState(() {
                    paymentMethod = "apple-pay";
                  });
                },
                title: Text(
                  "Apple Pay",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).disabledColor),
                ),
                leading: Icon(
                  FontAwesomeIcons.apple,
                  color: Theme.of(context).primaryColor,
                ),
                trailing: Radio(
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = value!;
                    });
                  },
                  value: "apple-pay",
                  activeColor: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
