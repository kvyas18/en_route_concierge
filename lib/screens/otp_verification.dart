import 'package:flutter/material.dart';
import 'package:en_route_concierge/widgets/custom_text_form_field.dart';

class OtpVerification extends StatefulWidget {
  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  late final TextEditingController _otp1Controller;
  late final TextEditingController _otp2Controller;
  late final TextEditingController _otp3Controller;
  late final TextEditingController _otp4Controller;

  @override
  void initState() {
    super.initState();

    // Initialize with empty string or preset value if any
    _otp1Controller = TextEditingController(text: ""); // set your initial value here if needed
    _otp2Controller = TextEditingController(text: "");
    _otp3Controller = TextEditingController(text: "");
    _otp4Controller = TextEditingController(text: "");
  }

  @override
  void dispose() {
    _otp1Controller.dispose();
    _otp2Controller.dispose();
    _otp3Controller.dispose();
    _otp4Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Verify Phone Number",
                      style: _theme.textTheme.titleLarge?.merge(
                        TextStyle(fontSize: 30.0),
                      ),
                    ),
                  ),
                  Text(
                    "Check your SMS messages, We've sent an OTP to 07033195813",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "",
                          verticalPadding: 25.0,
                          value: _otp1Controller.text,
                          controller: _otp1Controller,
                          suffixIcon: SizedBox.shrink(),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "",
                          verticalPadding: 25.0,
                          value: _otp2Controller.text,
                          controller: _otp2Controller,
                          suffixIcon: SizedBox.shrink(),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "",
                          verticalPadding: 25.0,
                          value: _otp3Controller.text,
                          controller: _otp3Controller,
                          suffixIcon: SizedBox.shrink(),
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: CustomTextFormField(
                          hintText: "",
                          verticalPadding: 25.0,
                          value: _otp4Controller.text,
                          controller: _otp4Controller,
                          suffixIcon: SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Wrap(
                    children: <Widget>[
                      Text(
                        "Didn't receive SMS?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "Resend Code",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45.0,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: _theme.primaryColor,
                ),
                onPressed: () {
                  final otp = _otp1Controller.text +
                      _otp2Controller.text +
                      _otp3Controller.text +
                      _otp4Controller.text;
                  print('OTP entered: $otp');
                },
                child: Text(
                  "VERIFY",
                  style: _theme.textTheme.bodyMedium?.merge(
                    TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
