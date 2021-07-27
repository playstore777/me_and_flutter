import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon_ui/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import 'poke_details_screen.dart';
import '/providers/data_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearch = false;
  TextEditingController? _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataProvider>(context);
    provider.fetch();
    return Scaffold(
      drawer: Drawer(
          // child: AppDrawer(),
          // fir kabhi karte hai, jab radio button etc use karna aye jab!
          ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        elevation: 10.0,
        centerTitle: true,
        title: isSearch
            ? TextField(
                controller: _textEditingController,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                cursorColor: Colors.white,
                onChanged: (value) {
                  provider.search(value);
                },
                onSubmitted: (value) {
                  print('value to be searched : $value');
                  provider.search(value);
                },
                decoration: InputDecoration(
                  focusColor: Colors.grey,
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            : Text(
                'Poke App',
                style: GoogleFonts.bellota(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearch = !isSearch;
                _textEditingController?.clear();
                provider.searchList.clear();
              });
            },
            icon: Icon(
              isSearch ? Icons.close : Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount:
            isSearch ? provider.searchList.length : provider.listOfData.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (ctx, index) => _pokeCard(
          isSearch ? provider.searchList[index] : provider.listOfData[index],
          context,
        ),
      ),
    );
  }

  Widget _pokeCard(pokemon, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => PokeDetailScreen(pokemon),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.grey,
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: screenWidth * 0.3,
                height: screenHeight * 0.15,
                child: FittedBox(
                  child: Hero(
                    tag: 'HeroImage${pokemon["id"]}',
                    child: Image(
                      image: NetworkImage(pokemon['img']),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: FittedBox(
                  child: Text(
                    pokemon['name'],
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.bellota(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
