import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatelessWidget {
   InfoScreen({Key? key}) : super(key: key);
   String _message = 'No Message';
  @override
  Widget build(BuildContext context) {
    ModalRoute? modalRoute = ModalRoute.of(context);
    if(modalRoute != null && modalRoute.settings.arguments != null){
      if(modalRoute.settings.arguments is Map<String, dynamic>){
        Map<String, dynamic> map = modalRoute.settings.arguments as Map<String, dynamic>;
        if (map.containsKey('message')){
          _message = map['message'];
        }
      }
    }
    return  Scaffold(
      appBar: AppBar(
        title: Text('Info'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Text(
          _message,
          style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

