import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '/widgets/content_list.dart';
import '/widgets/custom_appbar.dart';
import '/widgets/sidebar_container.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<bool> isSelectedList = [false, false, false, true, false];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              color: Colors.white,
            ),
            Container(
              width: screenWidth * 0.2,
              height: screenHeight,
              color: Color(0xFFFFF8F6),
              child: Padding(
                padding: EdgeInsets.only(top: (screenHeight * 0.04)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SideBarContainer(
                      width: screenWidth,
                      name: 'Gold Brew',
                      isSelectedFunction: _selector,
                      isSelected: isSelectedList[0],
                      index: 0,
                    ),
                    SideBarContainer(
                      width: screenWidth,
                      name: 'McCafe',
                      isSelectedFunction: _selector,
                      isSelected: isSelectedList[1],
                      index: 1,
                    ),
                    SideBarContainer(
                      width: screenWidth,
                      name: 'Nescafe',
                      isSelectedFunction: _selector,
                      isSelected: isSelectedList[2],
                      index: 2,
                    ),
                    SideBarContainer(
                      width: screenWidth,
                      name: 'Cold Brew',
                      isSelectedFunction: _selector,
                      isSelected: isSelectedList[3],
                      index: 3,
                    ),
                    SideBarContainer(
                      width: screenWidth,
                      name: 'Black Gold',
                      isSelectedFunction: _selector,
                      isSelected: isSelectedList[4],
                      index: 4,
                    ),
                  ],
                ),
              ),
            ),
            CustomAppBar(),
            Positioned(
              top: 80,
              left: 120,
              child: Container(
                child: Text(
                  'CoffeeHouse',
                  style: GoogleFonts.bigShouldersText(
                    fontSize: 38,
                    color: Color(0xfff1F0D3C),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 125,
              left: 120,
              child: Container(
                child: Text(
                  'A lot can happen over coffee.',
                  style: GoogleFonts.bigShouldersText(
                    color: Colors.grey.withOpacity(0.7),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 165,
              left: 120,
              child: Container(
                height: screenHeight * 0.065,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFA59FB0),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                width: screenWidth * 0.6,
                child: Padding(
                  padding: const EdgeInsets.only(top: 2, left: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color(0xFFA59FB0),
                      ),
                      hintText: 'SEARCH.....',
                      hintStyle: GoogleFonts.bigShouldersText(
                        color: Color(0xFFA59FB0),
                        fontSize: 15.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (screenHeight / 2) * 0.6,
              left: (screenWidth / 2) * 0.6,
              child: ContentList(
                screenHeight,
                screenWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selector(int index) {
    int prevIndex = isSelectedList.indexOf(true);
    if (prevIndex == index) return;
    setState(() {
      isSelectedList[index] = true;
      isSelectedList[prevIndex] = false;
    });
    print('prevIndex : $prevIndex');
  }
}
