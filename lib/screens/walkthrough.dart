import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:en_route_concierge/providers/walkthrough_provider.dart';
import 'package:en_route_concierge/router.dart';
import 'package:en_route_concierge/widgets/walkthrough_stepper.dart';

class WalkThrough extends StatelessWidget {
  final PageController _pageViewController = PageController(initialPage: 0);

  final List<Map<String, String>> walkthroughData = [
    {
      "title": "Luxury Delivery, Simplified.",
      "subtitle":
          "Schedule secure, white-glove pickups and deliveries at your fingertips — tailored for luxury brands.",
      "image": "assets/images/walkthrough1.jpg"
    },
    {
      "title": "Earn Trust, Ride with Precision",
      "subtitle":
          "Experience consistent, discreet service every time — because your brand deserves nothing less.",
      "image": "assets/images/walkthrough2.jpg"
    },
    {
      "title": "Invite. Share. Elevate.",
      "subtitle":
          "Refer fellow luxury clients and enjoy premium rewards curated exclusively for you.",
      "image": "assets/images/walkthrough3.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final walkthroughProvider =
        Provider.of<WalkthroughProvider>(context, listen: false);

    return Scaffold(
      body: PageView.builder(
        controller: _pageViewController,
        itemCount: walkthroughData.length,
        onPageChanged: (index) => walkthroughProvider.onPageChange(index),
        itemBuilder: (context, index) {
          final data = walkthroughData[index];

          return Stack(
            fit: StackFit.expand,
            children: [
              // 🔥 Fullscreen Background
              Image.asset(
                data["image"]!,
                fit: BoxFit.cover,
              ),

              // 🖤 Overlay fade
              Container(color: Colors.black.withOpacity(0.4)),

              // 📄 Text & Button content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["title"]!,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      data["subtitle"]!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                    ),
                    SizedBox(height: 40),

                    // 📍 Bottom row with stepper + button
                    Row(
                      children: [
                        Expanded(
                          child: WalkthroughStepper(
                            controller: _pageViewController,
                          ),
                        ),
                        ClipOval(
                          child: Container(
                            color: Theme.of(context).primaryColor,
                            child: IconButton(
                              icon: Icon(Icons.trending_flat,
                                  color: Colors.white),
                              onPressed: () {
                                if (_pageViewController.page! >= 2) {
                                  Navigator.of(context).pushReplacementNamed(
                                      UnAuthenticatedPageRoute);
                                } else {
                                  _pageViewController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                }
                              },
                              padding: EdgeInsets.all(13.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}