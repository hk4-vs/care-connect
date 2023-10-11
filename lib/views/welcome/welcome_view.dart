import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/doctor_consultation_03.jpg"),
              )),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Your ",
                            style: Theme.of(context).textTheme.headlineSmall,
                            children: [
                              TextSpan(
                                  text: "Ultimate Doctor ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor)),
                              const TextSpan(text: " Appointment Booking App")
                            ]),
                      ])),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Book appointments effortlessly and manage your health journey.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).disabledColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      child: Text(
                        "Let's Go Started",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).primaryColorLight,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {}),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?  ",
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text(
                        "Sign in",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
