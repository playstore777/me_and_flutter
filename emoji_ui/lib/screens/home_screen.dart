import 'package:emoji_ui/screens/burger_screen.dart';
import 'package:flutter/material.dart';

import '/widgets/reusable/intro_text_reusable.dart';
import '/widgets/reusable/app_bar_reusable.dart';
import '/widgets/recommended_card.dart';
import '/widgets/tab_bar_content.dart';
import '/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  TextEditingController? _textEditingController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            AppBarReusable(false),
            IntroTextReusable(
              firstText: 'SEARCH FOR',
              secondText: 'RECIPES',
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 15,
                top: 25,
                bottom: 15,
              ),
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.07,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 10,
                  ),
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black54,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                top: 10,
                bottom: 10,
              ),
              child: Text(
                'Recommended',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                top: 10,
                bottom: 10,
              ),
              child: Container(
                height: size.height * 0.25,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => BurgerScreen(),
                          ),
                        );
                      },
                      child: RecommendedCard(
                        color: Colors.orange,
                        textColor: Color(0xFFDA9551),
                        image: 'assets/burger.png',
                        text: 'Hamburg',
                        price: '21',
                      ),
                    ),
                    RecommendedCard(
                      textColor: Color(0xFF6A8CAA),
                      color: Colors.blue,
                      image: 'assets/fries.png',
                      text: 'Chips',
                      price: '15',
                    ),
                    RecommendedCard(
                      color: Colors.green,
                      textColor: Color(0xFF56CC7E),
                      image: 'assets/doughnut.png',
                      text: 'Doughnut',
                      price: '45',
                    ),
                  ],
                ),
              ),
            ),
            TabBar(
              isScrollable: true,
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.transparent,
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[400],
              tabs: [
                Tab(
                  child: Text('FEATURED'),
                ),
                Tab(
                  child: Text('COMBOS'),
                ),
                Tab(
                  child: Text('FAVORITES'),
                ),
                Tab(
                  child: Text('RECOMMENDED'),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: TabBarView(
                controller: _tabController,
                children: [
                  TabBarContent(Constants.featuredList),
                  TabBarContent(Constants.featuredList),
                  TabBarContent(Constants.featuredList),
                  TabBarContent(Constants.featuredList),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
