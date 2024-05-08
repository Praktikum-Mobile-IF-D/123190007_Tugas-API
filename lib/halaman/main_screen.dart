import 'package:flutter/material.dart';
import 'package:ta_mobile/halaman/profile_screen.dart';
import 'list_doa_screen.dart';

const primaryColor = Color(0xFF647c64);

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  // BOTTOM NAVBAR CONDITION
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
    }
    if (_selectedIndex == 1) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (BuildContext context) => ProfileScreen()));
    }
  }
  // END OF BOTTOM NAVBAR CONDITION

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          "Aplikasi Bacaan Doa",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
          children: [
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), // Adjust the radius as per your preference
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), // Adjust the shadow color and opacity
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 2), // Adjust the horizontal and vertical offset
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 110,
                    backgroundImage: AssetImage('images/berdoa.jng'),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: ElevatedButton(
                          onPressed: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoaListScreen(),
                                )
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            primary: primaryColor,
                            minimumSize: Size(200, 50),
                          ),
                          child: Text("Kumpulan Doa")
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

              ],
            ),
          ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: primaryColor,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
