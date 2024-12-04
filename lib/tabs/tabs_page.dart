import 'package:flutter/material.dart';
import '../tabs/bottom_tabs.dart';

class TabsPage extends StatefulWidget {
  int selectedIndex = 0;
  String navigationMethod = "";
  bool firstInstance = true;

  TabsPage({required this.selectedIndex, required this.navigationMethod});

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;
  bool _isDrawerOpen = false; // Track drawer state
  void _onItemTapped(int index, {bool fromBottomNavigation = false}) {
    setState(() {
      widget.firstInstance = false;
      switch (index) {
        case 0:
          _updateState(index: 1, selectedIndex: 0);
          break;

        case 1:
          if (widget.navigationMethod == "sidebar" && !fromBottomNavigation) {
            _updateState(index: 1, selectedIndex: 0);
            widget.navigationMethod = "app_startup";
          } else {
            _updateState(index: 4, selectedIndex: 1);
          }
          break;

        case 2:
          _updateState(index: 6, selectedIndex: 2);
          break;

        case 3:
          _updateState(index: 12, selectedIndex: 3);
          break;

        case 4:
          _updateState(index: 7, selectedIndex: 4);
          break;

        default:
          _updateState(index: index, selectedIndex: index);
          break;
      }
      print(_selectedIndex);
    });
  }

  void _updateState({required int index, required int selectedIndex}) {
    widget.selectedIndex = index;
    _selectedIndex = selectedIndex;
  }

  @override
  void initState() {
    print("its called");
    if (widget.selectedIndex == 0) {
      widget.firstInstance = true;
    } else {
      _onItemTapped(widget.selectedIndex);
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5),
        child: AppBar(
          backgroundColor: Color(0xFF00004C),
          // Fixed custom color
        ),
      ),
      body: Scaffold(
        onDrawerChanged: (isOpen) {
          setState(() {
            _isDrawerOpen = isOpen; // Update drawer state
            print(isOpen);
          });
        },
        body: IndexedStack(
          index: widget.selectedIndex,
          children: [
            for (final tabItem in TabNavigationItem.items) tabItem.page,
          ],
        ),
      ),
      bottomNavigationBar: _isDrawerOpen
          ? null
          : BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xFF01B4D2),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: '',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: ''),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor:
                  widget.firstInstance ? Colors.white : const Color(0xFF005277),
              unselectedItemColor: Colors.white,
              onTap: (index) =>
                  _onItemTapped(index, fromBottomNavigation: true),
            ),
    );
  }
}
