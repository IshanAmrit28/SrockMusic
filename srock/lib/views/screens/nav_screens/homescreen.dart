import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:srock/views/screens/nav_screens/home_nav_pages/book_now.dart';
import '../widgets/background.dart';
import '../widgets/header.dart';
import 'home_nav_pages/lyrics.dart';
import 'home_nav_pages/mixing.dart';
import 'home_nav_pages/music_production.dart';
import 'home_nav_pages/vocals.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  List<Map<String, dynamic>> rowItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRowItems();
  }

  Future<void> fetchRowItems() async {
    try {
      final snapshot = await db.collection('services').get();

      final items = snapshot.docs.map((doc) {
        final data = doc.data();
        return {
          'background': data['background'] as String,
          'leftIcon': data['leftIcon'] as String,
          'title': data['title'] as String,
          'subtitle': data['subtitle'] as String,
          'rightIcon': data['rightIcon'] as String,
          'pageId': data['pageId'] as String,
        };
      }).toList();

      setState(() {
        rowItems = items;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching Firestore data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget? getPageById(String pageId) {
    switch (pageId) {
      case 'music':
        return MusicProductionPage();
      case 'mixing':
        return MixingPage();
      case 'lyrics':
        return LyricsPage();
      case 'vocals':
        return VocalsPage();
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Center(
          child: Column(
            children: [
              // Top Search and Frame Section
              Expanded(
                flex: 293,
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF550120),
                        Color(0xFFA90140),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Header(),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/frame75.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const BookNow()),
                                  );
                                },
                                child: const Text(
                                  'Book Now',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Lower Section
              Expanded(
                flex: 423,
                child: Column(
                  children: [
                    Expanded(
                      flex: 60,
                      child: Center(
                        child: Text(
                          'Hire hand-picked Pros for popular music services',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.syne(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 300,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: rowItems.map((item) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    final page = getPageById(item['pageId']);
                                    if (page != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => page),
                                      );
                                    }
                                  },
                                  child: Container(
                                    height: 67,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.3),
                                        width: 1,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Opacity(
                                            opacity: 0.1,
                                            child: Image.asset(
                                              item['background'],
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 47,
                                                height: 47,
                                                child: Image.asset(item['leftIcon']),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      item['title'],
                                                      style: GoogleFonts.syne(
                                                        textStyle: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w700,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      item['subtitle'],
                                                      style: GoogleFonts.syne(
                                                        textStyle: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w400,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6.88,
                                                height: 13.75,
                                                child: Image.asset(item['rightIcon']),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),

                    // Add any bottom spacer here if needed

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
