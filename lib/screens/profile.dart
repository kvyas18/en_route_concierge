import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:en_route_concierge/styles/colors.dart';
import 'package:en_route_concierge/widgets/custom_text_form_field.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "Joe Smith");
    _emailController = TextEditingController(text: "joesmith@gmail.com");
    _phoneController = TextEditingController(text: "1-111-222-3333");
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
          icon: Icon(FontAwesomeIcons.times),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Hello Joe!",
                    style: _theme.textTheme.titleLarge
                        ?.merge(TextStyle(fontSize: 26.0)),
                  ),
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(
                      "https://pbs.twimg.com/profile_images/1214214436283568128/KyumFmOO.jpg",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.0),
              CustomTextFormField(
                hintText: "Name",
                value: "Olayemi Garuba", // keeping your original value param
                controller: _nameController,
                verticalPadding: 18.0,
                suffixIcon: SizedBox.shrink(),
              ),
              SizedBox(height: 15.0),
              CustomTextFormField(
                hintText: "Email",
                value: "donyemisco@gmail.com",
                controller: _emailController,
                verticalPadding: 18.0,
                suffixIcon: Icon(
                  Icons.check_circle,
                  color: _theme.primaryColor,
                ),
              ),
              SizedBox(height: 15.0),
              CustomTextFormField(
                hintText: "Phone Number",
                value: "444-509-980-103",
                controller: _phoneController,
                verticalPadding: 18.0,
                suffixIcon: SizedBox.shrink(),
              ),
              SizedBox(height: 15.0),
              Text(
                "PREFERENCES",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0,
                  color: Color(0xFF9CA4AA),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFD),
                  border: Border.all(color: Color(0xffD6D6D6)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "RECEIVE RECEIPT MAILS",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Switch(
                          value: true,
                          activeColor: _theme.primaryColor,
                          onChanged: (bool state) {},
                        ),
                      ],
                    ),
                    Text(
                      "The switch is the widget used to achieve the popular.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Color(0xffFBFBFD)),
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "SOCIAL NETWORK",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                        color: Color(0xFF9CA4AA),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    SizedBox(
                      height: 45.0,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: facebookColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.facebookSquare,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: Text(
                                "Connect with Facebook",
                                textAlign: TextAlign.center,
                                style: _theme.textTheme.bodyMedium?.merge(
                                  TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: _theme.primaryColor),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      margin: EdgeInsets.only(top: 10.0),
                      height: 45.0,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: _theme.scaffoldBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.google,
                              size: 18.0,
                              color: _theme.primaryColor,
                            ),
                            Expanded(
                              child: Text(
                                "Connect with Google",
                                textAlign: TextAlign.center,
                                style: _theme.textTheme.bodyMedium?.merge(
                                  TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: _theme.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
