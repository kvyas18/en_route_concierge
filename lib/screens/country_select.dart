import 'package:flutter/material.dart';
import 'package:en_route_concierge/data/countries.dart';

class SelectCountry extends StatefulWidget {
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  final List<String> _alphabets = [
    "A", "B", "C", "D", "E", "F", "G",
    "H", "I", "J", "K", "L", "M", "N",
    "O", "P", "Q", "R", "S", "T", "U",
    "V", "W", "Y", "Z"
  ];

  late List<String> _countries;
  late List<String> _filteredCountries;
  final ScrollController _listController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _countries = countryNames;
    _filteredCountries = _countries;
  }

  void _filterCountries(String query) {
    setState(() {
      _filteredCountries = _countries
          .where((country) => country.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _scrollToAlphabet(String letter) {
    final index = _filteredCountries.indexWhere(
      (country) => country.toUpperCase().startsWith(letter),
    );
    if (index != -1) {
      _listController.animateTo(
        index * 60.0,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: true,
        elevation: 0,
        title: Text("Select Country", style: theme.textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              color: Color(0xffEEF1F8),
              child: TextFormField(
                controller: _searchController,
                onChanged: _filterCountries,
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search...",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _filteredCountries.isEmpty
                        ? Center(child: Text("No countries found"))
                        : ListView.builder(
                            controller: _listController,
                            itemCount: _filteredCountries.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  _filteredCountries[index],
                                  style: theme.textTheme.bodyLarge,
                                ),
                                onTap: () {
                                  Navigator.pop(context, _filteredCountries[index]);
                                },
                              );
                            },
                          ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _alphabets.map((letter) {
                      return GestureDetector(
                        onTap: () => _scrollToAlphabet(letter),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            letter,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: theme.primaryColor,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
