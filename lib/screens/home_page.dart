import 'package:flutter/material.dart';

import 'questions_pages/quiz_page.dart';
import '/screens/score_page.dart';
import 'profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;
  late Widget _currentPage;
  late List<Widget> _pages;
  late QuizScreen _quizScreen;
  late ScoreScreen _scoreScreen;
  late ProfileScreen _profileScreen;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _quizScreen = const QuizScreen();
    _scoreScreen = const ScoreScreen();
    _profileScreen = const ProfileScreen();
    _pages = [_quizScreen, _scoreScreen, _profileScreen];
    _currentPage = _quizScreen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "QuizU",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: const [Divider()],
          ),
          PageView(
            allowImplicitScrolling: true,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedTab = index;
              });
            },
            children: _pages,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _selectedTab,
        selectedLabelStyle: const TextStyle(
          color: Colors.black,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
        ),
        onTap: (int index) {
          setState(() {
            _selectedTab = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
            if (index == 0 || index == 1 || index == 2) {
              _currentPage = _pages[index];
            }
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35.0,
                color: _selectedTab == 0 ? Colors.black : Colors.grey,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.score,
                size: 35.0,
                color: _selectedTab == 1 ? Colors.black : Colors.grey,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 35.0,
                color: _selectedTab == 2 ? Colors.black : Colors.grey,
              ),
              label: ""),
        ],
      ),
    );
  }
}
