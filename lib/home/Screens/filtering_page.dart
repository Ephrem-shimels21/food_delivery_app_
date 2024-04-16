import 'package:flutter/material.dart';
import 'package:food_delivery_appb/auth/widgets/rectangle_button.dart';
import 'package:food_delivery_appb/auth/widgets/rounded_textfield.dart';
import 'package:food_delivery_appb/common/clipper_path.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';
import 'package:go_router/go_router.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPage();
}

class _FilterPage extends State<FilterPage> {
  TextEditingController searchController = TextEditingController();
  String? _selectedType;
  String? _selectedLocation;
  String? _selectedFood;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: ClipPath(
              clipper: CustomClipperPath(),
              child: Image.asset(
                "assets/img/splash_bg.png",
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 60, 30, 20),
            child: Align(
                alignment: Alignment.topRight,
                child: Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                        spreadRadius: 5,
                        offset: Offset(2.0, 2.0),
                      ),
                    ], color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      icon: Icon(Icons.notifications_outlined,
                          color: UniversalColors.primary, size: 30),
                      onPressed: () {},
                    ))),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("Find Your\nFavorite Food",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? media.width * 0.09
                            : media.width * 0.035,
                        color: UniversalColors.primaryText,
                        fontFamily: "metropolis",
                        fontWeight: FontWeight.w800,
                      )))),
          Padding(
              padding: EdgeInsets.only(
                  top:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? media.height * 0.22
                          : media.height * 0.40,
                  left: 0,
                  right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: media.width * 0.9,
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: RoundTextfield(
                        controller: searchController,
                        hintText: "What do you want to order?",
                        bgColor: UniversalColors.primary.withOpacity(0.2),
                        left:
                            Icon(Icons.search, color: UniversalColors.primary),
                      )),
                ],
              ))
        ],
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: filterRow('Type', ["Restaurant", "Menu"]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: filterRow('Location', ['1 Km', '>10 Km', '<10 Km']),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: filterRow('Food', [
            'Cake',
            'Soup',
            'Main Course',
            'Appetizer',
            "Dessert",
            'Cake',
            'Soup',
            'Main Course',
            'Appetizer',
            "Dessert"
          ]),
        ),
      ),
      Container(
          margin: const EdgeInsets.only(top: 30, bottom: 10),
          child: RectangleButton(
              text: "Search",
              onPressed: () {
                context.go('/home');
              },
              width: media.width * 0.9,
              height: media.height * 0.08)),
    ])));
  }

  Widget filterRow(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          children: options
              .map((option) => GestureDetector(
                    onTap: () {
                      setState(() {
                        if (title == 'Type') {
                          _selectedType =
                              _selectedType == option ? null : option;
                        }
                        if (title == 'Location') {
                          _selectedLocation =
                              _selectedLocation == option ? null : option;
                        }
                        if (title == 'Food') {
                          _selectedFood =
                              _selectedFood == option ? null : option;
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: (title == 'Type' && _selectedType == option) ||
                                (title == 'Location' &&
                                    _selectedLocation == option) ||
                                (title == 'Food' && _selectedFood == option)
                            ? UniversalColors.primary.withOpacity(0.3)
                            : UniversalColors.primary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            option,
                            style: TextStyle(
                              color: UniversalColors.primary,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          if ((title == 'Type' && _selectedType == option) ||
                              (title == 'Location' &&
                                  _selectedLocation == option) ||
                              (title == 'Food' && _selectedFood == option))
                            Icon(Icons.check, color: UniversalColors.primary),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
