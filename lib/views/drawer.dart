import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shareweb/utilities/data/data.dart';
import 'package:shareweb/views/cart_screen.dart';
import 'package:shareweb/views/professional_requirements.dart';

class DrawerWidget extends StatefulWidget {
  final Function position;
  DrawerWidget({
    @required this.position,
  });
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal[400],
            ),
            child: Text(
              'Drawer Header',
              style: GoogleFonts.shadowsIntoLight(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
            ),
            child: FlatButton(
              child: Text(
                'Orders (${currentUser.cart.length})',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CartScreen(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
            ),
            child: FlatButton(
              child: Text(
                'update Location',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                setState(
                  () {
                    try {
                      widget.position;
                    } catch (e) {
                      print(e);
                    }
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
            ),
            child: FlatButton(
              child: Text(
                'Become Professional',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Requirements()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
