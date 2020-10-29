import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/views/SearchPage.dart';
import 'package:netflix_clone/views/detailsPage.dart';
import 'package:netflix_clone/views/downloadPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentScreenIndex = 0;
  List _pages = [HomeScree(),SearchPage(),Container(),DownloadsPage(),Container()];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: currentScreenIndex,
        selectedLabelStyle: GoogleFonts.poppins(fontSize: 14),
        unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
        onTap: (index) {
          setState(() {
            currentScreenIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 2),
              child: Image.asset(
                'assets/home.png',
                scale: 22,
                color: Colors.white,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 2),
              child: Image.asset(
                'assets/search.png',
                scale: 22,
                color: Colors.white,
              ),
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 2),
              child: Image.asset(
                'assets/coming.png',
                scale: 22,
                color: Colors.white,
              ),
            ),
            label: "Soon",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 2),
              child: Image.asset(
                'assets/download.png',
                scale: 22,
                color: Colors.white,
              ),
            ),
            label: "Download",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 2),
              child: Image.asset(
                'assets/more.png',
                scale: 22,
                color: Colors.white,
              ),
            ),
            label: "More",
          ),
        ],
      ),
      body: _pages[currentScreenIndex]
    );
  }
}

class HomeScree extends StatefulWidget {
  @override
  _HomeScreeState createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScree> {
  final fireStore = FirebaseFirestore.instance;
  Future getPosters({collName}) async {
    QuerySnapshot snapshot = await fireStore.collection(collName).get();
    return snapshot.docs;
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.black,
          title: Image.asset(
            'assets/netflix.png',
            scale: 20,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  "TV Shows",
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  "Movies",
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  "My List",
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              'https://roboraptor.24.hu/app/uploads/sites/4/2015/09/daredevil-logo.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 28,
                    color: Colors.white,
                  ),
                  Text(
                    "My List",
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                padding:
                EdgeInsets.only(left: 15, right: 15, top: 12, bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.play_arrow,
                      size: 28,
                      color: Colors.black87,
                    ),
                    Text(
                      "Play",
                      style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontSize: 19,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 28,
                    color: Colors.white,
                  ),
                  Text(
                    "More",
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: Container(
              padding: EdgeInsets.only(top: 25, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Continue Watching For Ninja",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 110,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 160,
                              width: 160,
                              child: Image.network(
                                  'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSgH9rr-sawXE6aGcdg30CWgcIP0TPwA0k8x8NgkqFtb5ItAfWn'),
                            ),
                            LinearProgressIndicator(
                              value: 50,
                              minHeight: 6,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {}),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {}),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: SizedBox(
                          width: 110,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 160,
                                width: 160,
                                child: Image.network(
                                  'https://upload.wikimedia.org/wikipedia/en/c/c3/OnePunchMan_manga_cover.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              LinearProgressIndicator(
                                value: 50,
                                minHeight: 6,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.info_outline,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {}),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {}),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text("Popular on Netflix",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 170,
                    child: FutureBuilder(
                      future: getPosters(collName: 'popular'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                      DetailsPage(
                                          snapshot: snapshot.data[index]),
                                      transition: Transition.cupertino);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 22),
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(
                                      snapshot.data[index]['posterURL'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text("Best of Thrillers",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 170,
                    child: FutureBuilder(
                      future: getPosters(collName: 'original'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                      DetailsPage(
                                          snapshot: snapshot.data[index]),
                                      transition: Transition.cupertino);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 22),
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(
                                      snapshot.data[index]['posterURL'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text("Animated Shows",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 170,
                    child: FutureBuilder(
                      future: getPosters(collName: 'animated'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                      DetailsPage(
                                          snapshot: snapshot.data[index]),
                                      transition: Transition.cupertino);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 22),
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(
                                      snapshot.data[index]['posterURL'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 390,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Available Now : Season 2",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 300,
                    child: Image.network(
                        'https://i.pinimg.com/originals/57/b9/ae/57b9ae81d5d3c4d124758103c224f380.jpg'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_arrow,
                              color: Colors.black87,
                              size: 40,
                            ),
                            Text(
                              "Play",
                              style: GoogleFonts.poppins(
                                  color: Colors.black87,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 40,
                          ),
                          Text(
                            "My Library",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text("Animated Shows",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 170,
                    child: FutureBuilder(
                      future: getPosters(collName: 'drama'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                      DetailsPage(
                                          snapshot: snapshot.data[index]),
                                      transition: Transition.cupertino);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 22),
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(
                                      snapshot.data[index]['posterURL'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

