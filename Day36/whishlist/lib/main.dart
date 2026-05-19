import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WishlistPage(),
    );
  }
}

class WishlistPage extends StatefulWidget {
  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {

  List<Map<String, dynamic>> items = [

    {
      "name": "MacBook Pro",
      "price": "₹1,89,999",
      "icon": Icons.laptop_mac,
      "liked": false,
    },

    {
      "name": "Samsung Galaxy S24",
      "price": "₹79,999",
      "icon": Icons.smartphone,
      "liked": false,
    },

    {
      "name": "AirPods Pro",
      "price": "₹24,999",
      "icon": Icons.headphones,
      "liked": false,
    },

    {
      "name": "Apple Watch",
      "price": "₹45,999",
      "icon": Icons.watch,
      "liked": false,
    },

    {
      "name": "Gaming Keyboard",
      "price": "₹6,999",
      "icon": Icons.keyboard,
      "liked": false,
    },

    {
      "name": "Bluetooth Speaker",
      "price": "₹4,499",
      "icon": Icons.speaker,
      "liked": false,
    },

    {
      "name": "DSLR Camera",
      "price": "₹92,000",
      "icon": Icons.camera_alt,
      "liked": false,
    },

    {
      "name": "PlayStation 5",
      "price": "₹54,990",
      "icon": Icons.sports_esports,
      "liked": false,
    },
  ];

  void toggleWishlist(int index) {

    setState(() {
      items[index]["liked"] = !items[index]["liked"];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xfff5f5f5),

      body: SafeArea(
        child: Column(
          children: [

            // HEADER
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 20,
              ),

              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: const [

                      Text(
                        "My Wishlist",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        "Favorite Gadgets & Devices",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    padding: EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.circular(15),
                    ),

                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),

            // PRODUCT LIST
            Expanded(
              child: ListView.builder(

                itemCount: items.length,

                itemBuilder: (context, index) {

                  return Container(

                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),

                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius:
                          BorderRadius.circular(25),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Row(
                      children: [

                        // PRODUCT ICON
                        Container(
                          height: 75,
                          width: 75,

                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:
                                BorderRadius.circular(18),
                          ),

                          child: Icon(
                            items[index]["icon"],
                            size: 38,
                            color: Colors.black87,
                          ),
                        ),

                        SizedBox(width: 18),

                        // PRODUCT DETAILS
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              Text(
                                items[index]["name"],
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight:
                                      FontWeight.w700,
                                ),
                              ),

                              SizedBox(height: 8),

                              Text(
                                items[index]["price"],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // HEART BUTTON
                        GestureDetector(

                          onTap: () {
                            toggleWishlist(index);
                          },

                          child: AnimatedContainer(

                            duration:
                                Duration(milliseconds: 250),

                            padding: EdgeInsets.all(12),

                            decoration: BoxDecoration(
                              color: items[index]["liked"]
                                  ? Colors.red.shade50
                                  : Colors.grey.shade100,

                              shape: BoxShape.circle,
                            ),

                            child: Icon(
                              items[index]["liked"]
                                  ? Icons.favorite
                                  : Icons.favorite_border,

                              color: items[index]["liked"]
                                  ? Colors.red
                                  : Colors.black54,

                              size: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}