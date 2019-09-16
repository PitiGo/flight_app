import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'CustomAppBar.dart';
import 'CustomShapeClipper.dart';

void main() => runApp(MaterialApp(
      title: "flight list mockup",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: appTheme,
    ));

Color firstColor = Color(0xFFF00000);
Color secondColor = Color(0xFFEF772C);

ThemeData appTheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');

List<String> locations = ['Boston (BOS)', 'New York (JFK)'];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      bottomNavigationBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          HomeScreenTopPart(),
          homeScreenBottomPart,
        ],
      ),
    );
    return scaffold;
  }
}

const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocationIndex = 0;

  bool isFlightSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [firstColor, secondColor],
            )),
            child: Column(
              children: <Widget>[
                SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(width: 16.0),
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedLocationIndex = index;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(locations[selectedLocationIndex],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0)),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<int>>[
                          PopupMenuItem(
                              child: Text(
                                locations[0],
                                style: dropDownMenuStyle,
                              ),
                              value: 0
                              //dropDownMenuStyle
                              ),
                          PopupMenuItem(
                              child: Text(
                                locations[1],
                                style: dropDownMenuStyle,
                              ),
                              value: 1
                              //dropDownMenuStyle
                              ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Where would\n you want to go?',
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: TextField(
                      style: dropDownMenuStyle,
                      controller: TextEditingController(text: locations[1]),
                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 13.0),
                        border: InputBorder.none,
                        suffixIcon: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          setState(() {
                            isFlightSelected = true;
                          });
                        },
                        child: ChoiceChip(
                            icon: Icons.flight,
                            text: "Flight",
                            isSelected: isFlightSelected)),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            isFlightSelected = false;
                          });
                        },
                        child: ChoiceChip(
                            icon: Icons.hotel,
                            text: "Hotel",
                            isSelected: !isFlightSelected)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;

  final bool isSelected;

  ChoiceChip({this.icon, this.text, this.isSelected});

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            )
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              )),
        ],
      ),
    );
  }
}

var viewAllStyle = TextStyle(
  fontSize: 14.0,
  color: appTheme.primaryColor,
);

var homeScreenBottomPart = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Currently wached items", style: dropDownMenuStyle),
          Spacer(),
          Text(
            "VIEW ALL(12)",
            style: viewAllStyle,
          ),
        ],
      ),
    ),
    Container(
      height: 210.0,
      // color: Colors.blue,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cityCards,
      ),
    ),
  ],
);

List<CityCard> cityCards = [
  CityCard(
    imagePath: "assets/images/lasvegas.jpg",
    cityName: "Las Vegas",
    monthYear: "abr 2019",
    oldPrice: 45,
    newPrice: 5444,
    discount: "50",
  ),
  CityCard(
    imagePath: "assets/images/athens.jpg",
    cityName: "Atenas",
    monthYear: "feb 2019",
    oldPrice: 43,
    newPrice: 1234,
    discount: "20",
  ),
  CityCard(
    imagePath: "assets/images/sydney.jpeg",
    cityName: "Sidney",
    monthYear: "mar 2019",
    oldPrice: 354,
    newPrice: 1234,
    discount: "30",
  ),
];

final formatCurrency = NumberFormat.simpleCurrency();

class CityCard extends StatelessWidget {
  final String imagePath;
  final String cityName;
  final String monthYear;
  final String discount;
  final int oldPrice;
  final int newPrice;

  const CityCard(
      {Key key,
      this.imagePath,
      this.cityName,
      this.monthYear,
      this.discount,
      this.oldPrice,
      this.newPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                height: 210,
                width: 160,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
                // color: Colors.red,
              ),
              Positioned(
                left: 0.0,
                bottom: 0.0,
                width: 160,
                height: 60,
                child: Container(
                  // color: Colors.black,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black, Colors.black.withOpacity(0.1)]),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                right: 10,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cityName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18.0),
                          ),
                          Text(
                            monthYear,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontSize: 14.0),
                          ),
                        ]),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        "$discount%",
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 5,
            ),
            Text(
              '${formatCurrency.format(newPrice)}',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '(${formatCurrency.format(oldPrice)})',
              style:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ]),
    );
  }
}
