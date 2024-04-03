import 'package:flutter/material.dart';
import 'package:travel_egypt/database.dart';

class Destination extends StatelessWidget {
  final dest;
  const Destination({super.key, required this.dest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 15,
                        offset: Offset(0, 7),
                        color: Colors.black54)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Hero(
                  tag: dest["imageUrl"],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.width,
                        image: AssetImage(dest["imageUrl"])),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // دا الكود بتاع الرجوع للصفحة اللي قبلها
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.sort,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 15,
                left: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          dest["city"],
                          style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_history,
                          size: 30,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          dest["country"],
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 10, 20, 5),
                        height: 140,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(110, 10, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 110,
                                      child: Text(
                                        activities[index]["name"],
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  Column(
                                    children: [
                                      Text(
                                        "\$${activities[index]["price"]}",
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Text(
                                        "per pax",
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                activities[index]["type"],
                                style: const TextStyle(color: Colors.grey),
                              ),
                              ratingStars(activities[index]["rating"]),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0XFFD8ECF1)),
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          activities[index]['startTimes'][0])),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0XFFD8ECF1)),
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          activities[index]['startTimes'][1])),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        bottom: 5,
                        left: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                              width: 130,
                              fit: BoxFit.cover,
                              image: AssetImage(activities[index]["imageUrl"])),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

Text ratingStars(int rate) {
  String stars = '';
  for (var i = 0; i < rate; i++) {
    stars += '⭐';
  }
  return Text(stars);
}
