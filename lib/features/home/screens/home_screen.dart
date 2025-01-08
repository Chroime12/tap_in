import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'themes/custom_theme.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: CustomTheme.lightTheme,
      // darkTheme: CustomTheme.darkTheme,
      // themeMode: ThemeMode.light,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      color: Colors.orange,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      color: Colors.white,
                    ),
                  ],
                ),
                const Column(
                  children: [
                    ProfileBar(),
                    SearchBarWidget(),
                    TitleSeeAll(
                        title: 'Recommended Jobs',
                        seeAll: 'See All',
                        color: Colors.white),
                    RecommendedJob(),
                    TitleSeeAll(
                        title: 'Recent Jobs',
                        seeAll: 'See All',
                        color: Colors.black),
                    NewPostedJobs()
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: 'Time In/Out',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.report),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class NewPostedJobs extends StatelessWidget {
  const NewPostedJobs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.50,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color.fromARGB(255, 207, 207, 207),
                    width: 0.6,
                  ),
                ),
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const Image(
                              image: AssetImage('assets/images/profile.png'),
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Library Assistant',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'NU Baliwag Learning Resource Center',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 125, 125, 125),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Divider(
                          color: Color.fromARGB(255, 209, 209, 209),
                          thickness: 1,
                          indent: 2,
                          endIndent: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 6.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 12.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.access_time,
                                      color: Color.fromARGB(255, 66, 66, 66),
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    '20+ hrs/week',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 66, 66, 66),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 12.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.calendar_month,
                                      color: Color.fromARGB(255, 66, 66, 66),
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    '1-2 months',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 66, 66, 66),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TitleSeeAll extends StatelessWidget {
  const TitleSeeAll({
    super.key,
    required this.title,
    required this.seeAll,
    required this.color,
  });

  final String title;
  final String seeAll;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: color,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            seeAll,
            style: TextStyle(
              color: color,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendedJob extends StatelessWidget {
  const RecommendedJob({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 275, // Set a height for the list based on screen height
        width: MediaQuery.of(context).size.width, // Set a bounded width
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5, // Number of items
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    height: 250, // Fixed height for each item
                    width: MediaQuery.of(context).size.width *
                        0.9, // Max width for each item
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0,
                                  right: 15.0,
                                  top: 20.0,
                                  bottom: 20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/profile.png',
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Layout Designer',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'NU Baliwag Marketing Office',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  // Add your onTap functionality here
                                  // print('Notification icon clicked');
                                },
                                child: const Icon(
                                  Icons.more_vert,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 0.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    0.77, // Limit the width
                                child: const Text(
                                  'We are looking for creative student assistants who are proficient in Canva and Photoshop.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2, // Set line height
                                  ),
                                  maxLines: 4, // Limit the text to 4 lines
                                  overflow: TextOverflow
                                      .ellipsis, // Add ellipsis if text overflows
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    top: 15.0,
                                    bottom: 10.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 5.0),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 218, 218, 218),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Text(
                                          'Design Skills',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 66, 66, 66),
                                            fontSize: 11.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 5.0),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 218, 218, 218),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Text(
                                          'Communication Skills',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 66, 66, 66),
                                            fontSize: 11.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Color.fromARGB(255, 217, 217, 217),
                          thickness: 0.8,
                          indent: 20,
                          endIndent: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.access_time,
                                        color: Color.fromARGB(255, 66, 66, 66),
                                        size: 20,
                                      ),
                                    ),
                                    Text(
                                      '20+ hrs/week',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 66, 66, 66),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.calendar_month,
                                        color: Color.fromARGB(255, 66, 66, 66),
                                        size: 20,
                                      ),
                                    ),
                                    Text(
                                      '1-2 months',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 66, 66, 66),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class ProfileBar extends StatefulWidget {
  const ProfileBar({super.key});

  @override
  State<ProfileBar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProfileBar> {
  final String name = 'Aeron Joshua Sarondo';
  final String subname = 'Student Applicant ';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subname,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
