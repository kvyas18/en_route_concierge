import 'package:flutter/material.dart';
import 'package:en_route_concierge/styles/colors.dart';
import 'package:en_route_concierge/widgets/custom_text_form_field.dart';

class UpdateInformation extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: _theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Update Information",
                      style: _theme.textTheme.titleLarge?.merge(
                        TextStyle(fontSize: 30.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  _updateProfileForm(),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45.0,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: _theme.primaryColor,
                ),
                onPressed: () {},
                child: Text(
                  "SAVE INFORMATION",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _updateProfileForm() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: CustomTextFormField(
                controller: firstNameController,
                hintText: "First name",
                value: firstNameController.text,
                verticalPadding: 15.0,
                suffixIcon: null,
              ),
            ),
            SizedBox(width: 15.0),
            Expanded(
              child: CustomTextFormField(
                controller: lastNameController,
                hintText: "Last name",
                value: lastNameController.text,
                verticalPadding: 15.0,
                suffixIcon: null,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        CustomTextFormField(
          controller: emailController,
          hintText: "Email",
          value: emailController.text,
          verticalPadding: 15.0,
          suffixIcon: null,
        ),
        SizedBox(height: 20.0),
        CustomTextFormField(
          controller: passwordController,
          hintText: "Password",
          value: passwordController.text,
          verticalPadding: 15.0,
          suffixIcon: null,
        ),
      ],
    );
  }
}
