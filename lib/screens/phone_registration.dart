import 'package:flutter/material.dart';
import 'package:en_route_concierge/widgets/custom_text_form_field.dart';

class PhoneRegistration extends StatelessWidget {
  final TextEditingController countryCodeController = TextEditingController(text: "+1");
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: _theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "What is your phone number?",
                      style: _theme.textTheme.titleLarge?.copyWith(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Text(
                    "Tap \"Get Started\" to get an SMS confirmation to help you use En Route Concierge.",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,

                        child: CustomTextFormField(
                          hintText: "+1",
                          verticalPadding: 15.0,
                          suffixIcon: null,
                          controller: countryCodeController,
                          value: countryCodeController.text, // ✅ required param
                          showLabel: false,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        flex: 2,
                        child: CustomTextFormField(
                          hintText: "+1",
                          verticalPadding: 15.0,
                          suffixIcon: null,
                          controller: countryCodeController,
                          value: countryCodeController.text, // ✅ required param
                          showLabel: false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 45.0,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: _theme.primaryColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  final phone = "${countryCodeController.text}${phoneNumberController.text}";
                  print("Phone submitted: $phone");
                },
                child: Text(
                  "GET STARTED",
                  style: _theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
