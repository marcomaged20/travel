import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_egypt/database.dart';
import 'package:travel_egypt/destination_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedicon = 0;

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List listicon = [
      FontAwesomeIcons.plane,
      FontAwesomeIcons.hotel,
      FontAwesomeIcons.taxi,
      FontAwesomeIcons.train,
      FontAwesomeIcons.motorcycle,
      FontAwesomeIcons.ship,
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_pizza), label: "pizza"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
          ]),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 5,
            ),
            const TellUs(),
            const SizedBox(
              height: 5,
            ),
            listOficons(listicon),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Destisnation",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "All Data",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: destination.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(
                                context) // دا الكود اللي بقدر من خلاله اني اتنقل لصفحة تانية
                            .push(MaterialPageRoute(builder: (context) {
                          return Destination(
                            dest: destination[index],
                          );
                        }));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 15, bottom: 15, left: 7, right: 7),
                        height: 100,
                        width: 210,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              bottom: 5,
                              child: Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 31),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${destination[index]["activities"].length} Activities",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        destination[index]['description'],
                                        style:
                                            const TextStyle(color: Colors.grey),
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 120,
                              width: 180,
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(4, 4),
                                        blurRadius: 10),
                                    BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(-4, 4),
                                        blurRadius: 10),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Hero(
                              tag: destination[index]["imageUrl"],
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  height: 120,
                                  width: 180,
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      destination[index]["imageUrl"]),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 130,
                              left: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        destination[index]["city"],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_searching,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        destination[index]["country"],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Exclusive Hotels",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "All Data",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF3EBACE)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hotels.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 7, right: 7),
                      height: 100,
                      width: 210,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            bottom: 5,
                            child: Container(
                              height: 100,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 31),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${hotels[index]["name"]} ",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      hotels[index]['address'],
                                      style:
                                          const TextStyle(color: Colors.grey),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      "\$${hotels[index]["price"]} ",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 120,
                            width: 180,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(4, 4),
                                      blurRadius: 10),
                                  BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(-4, 4),
                                      blurRadius: 10),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              height: 120,
                              width: 180,
                              fit: BoxFit.cover,
                              image: AssetImage(hotels[index]["imageUrl"]),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  SizedBox listOficons(List<dynamic> listicon) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listicon.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedicon = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: (_selectedicon == index)
                    ? Theme.of(context).primaryColorLight
                    : const Color(0XFFE7EBEE),
              ),
              child: Icon(
                listicon[index],
                color: (_selectedicon == index)
                    ? Theme.of(context).primaryColor
                    : const Color(0XFFB4C1C4),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TellUs extends StatelessWidget {
  const TellUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20, right: 225),
      child: Text(
        "tell us about your destinaton in Egypt !! ",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
