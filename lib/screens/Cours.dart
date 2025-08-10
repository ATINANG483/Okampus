import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> courses = [
    {
      "image": "assets/course1.jpg",
      "discount": "-18%",
      "tags": ["Design", "Intermediate"],
      "title": "Mobile App Design with Material You",
      "team": "Teatcha Team",
      "duration": "24 hours",
      "rating": 4.7,
      "price": "Ouvrir",
      "oldPrice": "Information"
    },
    {
      "image": "assets/course2.jpg",
      "discount": "-23%",
      "tags": ["Design", "Advanced"],
      "title": "Design Thinking for Digital Products",
      "team": "Teatcha Team",
      "duration": "30 hours",
      "rating": 4.8,
      "price": "Ouvrir",
      "oldPrice": "Information"
    },
    {
      "image": "assets/course3.png",
      "discount": "-17%",
      "tags": ["Design", "Intermediate"],
      "title": "UI Animation and Motion Design in Flutter",
      "team": "Teatcha Team",
      "duration": "22 hours",
      "rating": 4.6,
      "price": "Ouvrir",
      "oldPrice": "Information"
    },
    {
      "image": "assets/course1.jpg",
      "discount": "-18%",
      "tags": ["Design", "Intermediate"],
      "title": "Mobile App Design with Material You",
      "team": "Teatcha Team",
      "duration": "24 hours",
      "rating": 4.7,
      "price": "Ouvrir",
      "oldPrice": "Information"
    },
    {
      "image": "assets/course2.jpg",
      "discount": "-23%",
      "tags": ["Design", "Advanced"],
      "title": "Design Thinking for Digital Products",
      "team": "Teatcha Team",
      "duration": "30 hours",
      "rating": 4.8,
      "price": "Ouvrir",
      "oldPrice": "Information"
    },
    {
      "image": "assets/course3.png",
      "discount": "-17%",
      "tags": ["Design", "Intermediate"],
      "title": "UI Animation and Motion Design in Flutter",
      "team": "Teatcha Team",
      "duration": "22 hours",
      "rating": 4.6,
      "price": "Ouvrir",
      "oldPrice": "Information"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // AppBar avec les 4 icônes
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Cours",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      actions: [
  IconButton(
    icon: Icon(Icons.search, color: Colors.lightBlue),
    onPressed: () {},
  ),
  IconButton(
    icon: Icon(Icons.notifications, color: Colors.lightBlue),
    onPressed: () {},
  ),
  IconButton(
    icon: Icon(Icons.chat, color: Colors.lightBlue),
    onPressed: () {},
  ),
  IconButton(
    icon: Icon(Icons.person, color: Colors.lightBlue),
    onPressed: () {},
  ),
],

      ),

      // Liste des cours
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.only(bottom: 16),
            elevation: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      child: Image.asset(
                        course["image"],
                        height: 110,
                        width: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 6,
                      left: 6,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          course["discount"],
                          style:
                              TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 6,
                          children: course["tags"].map<Widget>((tag) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: tag == "Design"
                                    ? Colors.pink[100]
                                    : Colors.orange[100],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                tag,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: tag == "Design"
                                      ? Colors.pink
                                      : Colors.orange,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 4),
                        Text(
                          course["title"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          course["team"],
                          style:
                              TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.access_time,
                                size: 14, color: Colors.grey),
                            SizedBox(width: 4),
                            Text(course["duration"],
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.star,
                                size: 14, color: Colors.amber),
                            SizedBox(width: 4),
                            Text(course["price"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                            SizedBox(width: 6),
                            Text(
                              course["oldPrice"],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                decoration:
                                    TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
