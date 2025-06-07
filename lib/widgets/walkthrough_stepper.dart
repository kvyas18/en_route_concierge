import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:en_route_concierge/providers/walkthrough_provider.dart';

class WalkthroughStepper extends StatelessWidget {
  final PageController controller;

  WalkthroughStepper({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Consumer<WalkthroughProvider>(
      builder: (context, walkthrough, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
                (index) {
              return GestureDetector(
                onTap: () {
                  controller.animateToPage(
                    index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(right: index < 2 ? 5.0 : 0),
                  height: 5.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: index <= walkthrough.currentPageValue
                        ? Theme.of(context).primaryColor
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
