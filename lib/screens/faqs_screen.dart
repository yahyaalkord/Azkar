import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key,required this.message}) : super(key: key);

final String message ;
  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQS'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          widget.message,
          style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
