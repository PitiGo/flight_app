import 'package:flight_app/main.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];

  CustomAppBar() {
    bottomBarItems.add(
      BottomNavigationBarItem(
        activeIcon:Icon(
          Icons.home,
          color: appTheme.primaryColor,
        ), 
        icon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        title: Text(
          "Explore",
          style: TextStyle(color: Colors.black,fontStyle: FontStyle.normal),
        ),
      ),
    );

    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        title: Text(
          "Watchlist",
          style: TextStyle(color: Colors.black,fontStyle: FontStyle.normal),
        ),
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.local_offer,
          color: Colors.black,
        ),
        title: Text(
          "Deals",
          style: TextStyle(color: Colors.black,fontStyle: FontStyle.normal),
        ),
      ),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.black,fontStyle: FontStyle.normal),
        ),
      ),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Material(
          elevation: 15,
          child: BottomNavigationBar(
        items: bottomBarItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
