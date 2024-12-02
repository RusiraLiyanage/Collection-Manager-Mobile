import 'package:flutter/material.dart';
import '../tabs/bottom_tabs.dart';

class TabsPage extends StatefulWidget {
  int selectedIndex = 0;

  TabsPage({required this.selectedIndex});

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    int stacked_index = 0;
    if (index == 2) {
      setState(() {
        stacked_index = index;
        index = 4;
        widget.selectedIndex = index;
        _selectedIndex = stacked_index;
      });
    } else if (index == 3) {
      setState(() {
        stacked_index = index;
        index = 6;
        widget.selectedIndex = index;
        _selectedIndex = stacked_index;
      });
    } else if (index == 4) {
      setState(() {
        stacked_index = index;
        index = 12;
        widget.selectedIndex = index;
        _selectedIndex = stacked_index;
      });
    } else if (index == 5) {
      setState(() {
        stacked_index = index;
        index = 7;
        widget.selectedIndex = index;
        _selectedIndex = stacked_index;
      });
    } else {
      setState(() {
        widget.selectedIndex = index;
        _selectedIndex = widget.selectedIndex;
        print(_selectedIndex);
      });
    }
    print(_selectedIndex);
  }

  @override
  void initState() {
    _onItemTapped(widget.selectedIndex);
    super.initState();
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
        body: IndexedStack(
          index: widget.selectedIndex,
          children: [
            for (final tabItem in TabNavigationItem.items) tabItem.page,
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF01B4D2),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: '',
          ),
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
        selectedItemColor: const Color(0xFF005277),
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
