import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/value_listener.dart';
import 'transform_screen.dart'; // Ajusta la ruta si es necesario

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedTab = _SelectedTab.home;

  Widget _getBodyForTab() {
    switch (_selectedTab) {
      case _SelectedTab.home:
        return Center(child: Text("Menu de opciones"));
      case _SelectedTab.favorite:
        return Center(child: Text("Tus favoritos"));
      case _SelectedTab.search:
        // Aquí puedes mostrar tu pantalla de Transform
        return TransformScreen();
      case _SelectedTab.person:
        return Center(child: Text("Perfil"));
      default:
        return Center(child: Text("Menu de opciones"));
    }
  }

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        actions: [
          ValueListenableBuilder(
            valueListenable: ValueListener.isDark,
            builder: (context, value, child) {
              return value
                  ? IconButton(
                    icon: Icon(Icons.sunny),
                    onPressed: () {
                      ValueListener.isDark.value = false;
                    },
                  )
                  : IconButton(
                    icon: Icon(Icons.nightlight),
                    onPressed: () {
                      ValueListener.isDark.value = true;
                    },
                  );
            },
          ),
        ],
      ),

      drawer: Drawer(),
      //body: Center(child: Text("Menu de opciones")),
      body: _getBodyForTab(),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          dotIndicatorColor: Colors.white,
          unselectedItemColor: Colors.grey[300],
          splashBorderRadius: 50,
          // enableFloatingNavBar: false,
          onTap: _handleIndexChanged,
          items: [
            /// Home
            DotNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              selectedColor: Color(0xff73544C),
            ),

            /// Likes
            DotNavigationBarItem(
              icon: Icon(Icons.favorite, size: 30),
              selectedColor: Color(0xff73544C),
            ),

            /// Search
            DotNavigationBarItem(
              icon: Icon(Icons.search, size: 30),
              selectedColor: Color(0xff73544C),
            ),

            /// Profile
            DotNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              selectedColor: Color(0xff73544C),
            ),
          ],
        ),
      ),
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
