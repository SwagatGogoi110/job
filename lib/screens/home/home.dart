import 'package:flutter/material.dart';
import 'package:jobfind/screens/home/widgets/job_list.dart';
import 'package:jobfind/screens/home/widgets/search_card.dart';
import 'package:jobfind/screens/home/widgets/tag_list.dart';
import 'package:jobfind/twitterfunc/views/create_tweet_view.dart';
import 'widgets/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey.withOpacity(0.1),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                const SearchCard(),
                TagList(),
                JobList(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff039BE5),
        elevation: 0,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreateTweet()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomAppBar(
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 24.0,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.work,
                  size: 24.0,
                ),
                label: 'Jobs',
              ),
              BottomNavigationBarItem(
                icon: Text(''),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.health_and_safety_sharp,
                  size: 24.0,
                ),
                label: 'Health',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.description,
                  size: 24.0,
                ),
                label: 'Schemes',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xff039BE5),
            unselectedItemColor: const Color(0xFF90A4AE),
            selectedFontSize: 10.0,
            unselectedFontSize: 10.0,
            unselectedLabelStyle: const TextStyle(
              color: Color(0xFF90A4AE),
              fontWeight: FontWeight.bold,
            ),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
