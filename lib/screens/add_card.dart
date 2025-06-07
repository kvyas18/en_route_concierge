import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:en_route_concierge/widgets/custom_text_form_field.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final TextEditingController _nameController =
  TextEditingController(text: "OLayemii Garuba");
  final TextEditingController _cardNumberController =
  TextEditingController(text: "**** **** **** **85");
  final TextEditingController _expiryController =
  TextEditingController(text: "09/25");
  final TextEditingController _cvvController =
  TextEditingController(text: "***");

  @override
  void dispose() {
    _nameController.dispose();
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Add credit card",
                style: _theme.textTheme.titleLarge,
              ),
              SizedBox(height: 50.0),
              SizedBox(
                height: 42.0,
                width: 160.0,
                child: ElevatedButton(
                  onPressed: () {
                    // Future card scanning logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _theme.primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.expand,
                        size: 18.0,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "SCAN CARD",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              CustomTextFormField(
                controller: _nameController,
                value: _nameController.text,
                hintText: "NAME",
                verticalPadding: 12.0,
                suffixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 25.0),
              CustomTextFormField(
                controller: _cardNumberController,
                value: _cardNumberController.text,
                hintText: "CREDIT CARD NUMBER",
                verticalPadding: 12.0,
                suffixIcon: Icon(Icons.credit_card),
              ),
              SizedBox(height: 25.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CustomTextFormField(
                      controller: _expiryController,
                      value: _expiryController.text,
                      hintText: "EXPIRY",
                      verticalPadding: 12.0,
                      suffixIcon: Icon(Icons.date_range),
                    ),
                  ),
                  SizedBox(width: 30.0),
                  Expanded(
                    child: CustomTextFormField(
                      controller: _cvvController,
                      value: _cvvController.text,
                      hintText: "CVV",
                      verticalPadding: 12.0,
                      suffixIcon: Icon(Icons.lock),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                "Debit cards are accepted at some locations and for some categories",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset("assets/images/mastercard.png"),
                  Image.asset("assets/images/visa.png"),
                ],
              ),
              SizedBox(height: 25.0),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: _theme.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: () {
                    print("Saved card:");
                    print("Name: ${_nameController.text}");
                    print("Card #: ${_cardNumberController.text}");
                    print("Expiry: ${_expiryController.text}");
                    print("CVV: ${_cvvController.text}");
                  },
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
