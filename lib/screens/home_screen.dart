import 'package:azkar/screens/faqs_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _cuonter = 0;
  String _box = 'استغفر الله';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        title: const Text('Azkar App'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          PopupMenuButton<String>(onSelected: (String value) {
            if (_box != value) {
              setState(() {
                _box = value;
                _cuonter = 0;
              });
            }
          }, itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text(
                  'سبحان الله',
                  style: GoogleFonts.arefRuqaa(),
                ),
                value: 'سبحان الله',
                height: 20,
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: Text(
                  'الحمد لله',
                  style: GoogleFonts.arefRuqaa(),
                ),
                value: 'الحمد لله',
                height: 20,
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: Text(
                  'استغفر الله',
                  style: GoogleFonts.arefRuqaa(),
                ),
                value: 'استغفر الله',
                height: 20,
              ),
            ];
          }),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/info_screen', arguments: {
                'message': 'Info Screen',
              });
            },
            icon: const Icon(Icons.info),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FaqsScreen(
                  message: 'FAQs SCREEN',
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.question_answer,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0XFF576F72),
              Color(0XFF7D9D9C),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                color: Color(0XFFE4DCCF),
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(35),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://ae01.alicdn.com/kf/H876570a60e6c44409a99550f72023762O/Onxy.jpg_Q90.jpg_.webp'),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 6,
                    offset: Offset(0, 0),
                  ),
                  // BoxShadow(
                  //     color: Colors.black45,
                  //     blurRadius: 6,
                  //     offset: Offset(0, -6)),
                ],
              ),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 6,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _box,
                      style: GoogleFonts.arefRuqaa(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 60,
                    color: const Color(0XFFE4DCCF),
                    child: Text(
                      _cuonter.toString(),
                      style: GoogleFonts.arefRuqaa(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0XFFC4DFAA),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          ++_cuonter;
                        });
                      },
                      child: Text(
                        'تسبيح',
                        style: GoogleFonts.arefRuqaa(
                            color: Colors.black,
                            fontSize: 16,
                            height: 3,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0XFFF5F0BB),
                        shape: const RoundedRectangleBorder(
                          borderRadius: const BorderRadiusDirectional.only(
                            bottomEnd: const Radius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _cuonter = 0;
                        });
                      },
                      child: const Text(
                        'إعادة',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            height: 3,
                            fontWeight: FontWeight.bold),
                        // GoogleFonts.arefRuqaa(),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState((){
          _cuonter+=1;
        });
      },
        child: const Icon(Icons.add),
      ),

    );
  }
}
