import 'package:care_connect/resources/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/components/custom_back_button_widget.dart';

class SingleChatView extends StatefulWidget {
  const SingleChatView({super.key});

  @override
  State<SingleChatView> createState() => _SingleChatViewState();
}

class _SingleChatViewState extends State<SingleChatView> {
  int maxLines = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: const Row(
          children: [
            Spacer(),
            CustomBackButtonWidget(),
          ],
        ),
        title: ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).disabledColor.withOpacity(0.5)),
                image: const DecorationImage(
                    image: AssetImage("assets/images/doctor1.png"))),
          ),
          title: Text(
            "Vinita Dhiwer",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
          ),
          subtitle: Text(
            "Online",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
          ),
          trailing: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              shape: BoxShape.circle,
              border: Border.all(
                  color: Theme.of(context).disabledColor.withOpacity(0.5)),
            ),
            child: Icon(
              CupertinoIcons.ellipsis_vertical,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: DataClass.chatData.length,
              itemBuilder: (_, index) {
                final data = DataClass.chatData[index];
                final bool isMe = data['sender'].toString() == "me";
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(20),
                        margin: EdgeInsets.only(
                            left: isMe ? 40 : 0,
                            right: isMe ? 0 : 40,
                            bottom: 6),
                        decoration: BoxDecoration(
                            color: (isMe)
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).primaryColorLight,
                            border: isMe
                                ? null
                                : Border.all(
                                    width: 0.5,
                                    color: Theme.of(context).disabledColor),
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(12),
                              topRight: const Radius.circular(12),
                              bottomLeft: isMe
                                  ? const Radius.circular(12)
                                  : const Radius.circular(0),
                              bottomRight: isMe
                                  ? const Radius.circular(0)
                                  : const Radius.circular(12),
                            )),
                        child: Text(
                          data['message'].toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: isMe
                                      ? Theme.of(context).primaryColorLight
                                      : Theme.of(context).primaryColorDark),
                        )),
                    Row(
                      mainAxisAlignment: isMe
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Theme.of(context)
                                      .disabledColor
                                      .withOpacity(0.5)),
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/doctor1.png"))),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(data['sender'])
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                );
              },
            ),
          )),
          Container(
            color: Theme.of(context).primaryColorLight,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12)),
              child: TextField(
                keyboardType: TextInputType.text,
                onSubmitted: (value) {},
                decoration: InputDecoration(
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(14),
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        CupertinoIcons.plus,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    suffixIcon: Container(
                      padding: const EdgeInsets.all(14),
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        CupertinoIcons.mic_fill,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Type a message here...",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).disabledColor)),
                maxLines: 4,
                minLines: 1,
                onChanged: (text) {
                  setState(() {
                    maxLines = text.split('\n').length;
                    if (maxLines > 4) {
                      maxLines = 4;
                    }
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
