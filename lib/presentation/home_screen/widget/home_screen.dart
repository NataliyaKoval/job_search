import 'package:flutter/material.dart';
import 'package:job_search/presentation/companies_screen/widget/companies_screen.dart';
import 'package:job_search/presentation/jobs_screen/widget/jobs_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const JobsScreen(),
    const CompaniesScreen(),
    Container(color: Colors.green,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: const Color(0xFF959B9D),
        selectedItemColor: const Color(0xFF2157ad),
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business_center,
            ),
            label: 'Job',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_city,
            ),
            label: 'Company',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.post_add,
            ),
            label: 'Add',
          ),
        ],
      ),
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
