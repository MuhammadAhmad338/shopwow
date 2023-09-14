import 'package:flutter/material.dart';
import 'package:shopwow/Widgets/appbutton.dart';

class DeliveryCtaText extends StatefulWidget {
  const DeliveryCtaText({super.key});

  @override
  State<DeliveryCtaText> createState() => _DeliveryCtaTextState();
}

class _DeliveryCtaTextState extends State<DeliveryCtaText> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(text: "Yasrab Colony"),
                  TextSpan(
                      text: "House no P72",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))
                ])),
                Text(
                  "Yasrab Colony Street no 3,4 sdasd",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          AppButton(text: "Change", onPressed: () {})
        ],
      ),
    );
  }
}
