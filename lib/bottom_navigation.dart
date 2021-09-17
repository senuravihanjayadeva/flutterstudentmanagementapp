import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation(this.selIndex);
  final selIndex;
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        currentIndex: widget.selIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF6200EE),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/list');
              break;
            case 2:
              Navigator.pushNamed(context, '/create');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            title: Text('List'),
            icon: Icon(Icons.list_alt_outlined),
          ),
          BottomNavigationBarItem(
            title: Text('Create'),
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
