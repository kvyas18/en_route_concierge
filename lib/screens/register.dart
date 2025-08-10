import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:en_route_concierge/router.dart';
import 'package:en_route_concierge/styles/colors.dart';
import 'package:en_route_concierge/widgets/custom_text_form_field.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _countryCodeController = TextEditingController(text: '+234');
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _countryCodeController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(LoginRoute);
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Log In",
                style: TextStyle(
                  color: _theme.primaryColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Sign Up",
                  style: _theme.textTheme.titleLarge?.copyWith(
                    fontSize: 30.0,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Form(
                key: _formKey,
                child: _signupForm(),
              ),
              SizedBox(height: 30.0),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 30.0),
                height: 45.0,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: _theme.primaryColor,
                  ),
                  onPressed: _registerUser,
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signupForm() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: _firstNameController,
                verticalPadding: 10.0,
                suffixIcon: SizedBox.shrink(),
                hintText: "First name",
                value: _firstNameController.text,
              ),
            ),
            SizedBox(width: 15.0),
            Expanded(
              child: CustomTextFormField(
                controller: _lastNameController,
                verticalPadding: 10.0,
                suffixIcon: SizedBox.shrink(),
                hintText: "Last name",
                value: _lastNameController.text,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        CustomTextFormField(
          controller: _emailController,
          verticalPadding: 10.0,
          suffixIcon: SizedBox.shrink(),
          hintText: "Email",
          value: _emailController.text,
        ),
        SizedBox(height: 20.0),
        Row(
          children: [
            Container(
              width: 80.0,
              child: CustomTextFormField(
                controller: _countryCodeController,
                verticalPadding: 10.0,
                suffixIcon: SizedBox.shrink(),
                hintText: "+234",
                value: _countryCodeController.text,
              ),
            ),
            SizedBox(width: 15.0),
            Expanded(
              child: CustomTextFormField(
                controller: _phoneController,
                verticalPadding: 10.0,
                suffixIcon: SizedBox.shrink(),
                hintText: "Phone number",
                value: _phoneController.text,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        CustomTextFormField(
          controller: _passwordController,
          verticalPadding: 10.0,
          suffixIcon: SizedBox.shrink(),
          hintText: "Password",
          value: _passwordController.text,
          obscureText: true,
        ),
        SizedBox(height: 25.0),
        Text(
          'By clicking "Sign Up" you agree to our terms and conditions as well as our privacy policy',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: dbasicDarkColor,
          ),
        ),
      ],
    );
  }

  Future<void> _registerUser() async {
    if (_formKey.currentState?.validate() ?? true) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final firstName = _firstNameController.text.trim();
      final lastName = _lastNameController.text.trim();
      final phone = '${_countryCodeController.text.trim()}${_phoneController.text.trim()}';

      // Firebase disabled: Just simulate navigation
      print("Simulating registration with:");
      print("Name: $firstName $lastName");
      print("Email: $email");
      print("Phone: $phone");

      // Simulate navigation to next screen
      Navigator.of(context).pushNamed(OtpVerificationRoute);
    }
  }
}
