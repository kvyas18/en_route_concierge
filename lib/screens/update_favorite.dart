import 'package:flutter/material.dart';
import 'package:en_route_concierge/styles/colors.dart';
import 'package:en_route_concierge/widgets/custom_text_form_field.dart';

class UpdateFavorite extends StatelessWidget {
  final TextEditingController placeNameController =
  TextEditingController(text: "McDonald's");
  final TextEditingController placeAddressController =
  TextEditingController(text: "13424 NE 20th St. Bellevue, WA, 98005");

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
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          "Update Profile",
          style: TextStyle(color: dbasicDarkColor),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 35.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.home),
                    label: Text(
                      "Home",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 35.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.work),
                    label: Text(
                      "Work",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 35.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.pin_drop),
                    label: Text(
                      "Other",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 70.0),
            CustomTextFormField(
              controller: placeNameController,
              hintText: "Place name",
              value: placeNameController.text,
              verticalPadding: 15.0,
              suffixIcon: null,
            ),
            SizedBox(height: 25.0),
            CustomTextFormField(
              controller: placeAddressController,
              hintText: "Place address",
              value: placeAddressController.text,
              verticalPadding: 15.0,
              suffixIcon: null,
            ),
            SizedBox(height: 25.0),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.map,
                color: Colors.white,
              ),
              label: Text(
                "PICK ON MAP",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: _theme.primaryColor,
              ),
            ),
            Expanded(child: SizedBox()),
            Container(
              color: Colors.yellow,
              height: 40.0,
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "SAVE LOCATION",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: _theme.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
