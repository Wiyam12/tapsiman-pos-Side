import 'package:flutter/material.dart';
import 'package:user/pages/addproduct.dart';
import 'package:user/pages/home.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<List<dynamic>> menu = [
    [
      'TAPSILOG',
      'RICE MEALS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'BANGSILOG',
      'RICE MEALS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'TOCILOG',
      'RICE MEALS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'COKE',
      'DRINKS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'SPRITE',
      'DRINKS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'TAPSILOG',
      'RICE MEALS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'BANGSILOG',
      'RICE MEALS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'TOCILOG',
      'RICE MEALS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'COKE',
      'DRINKS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
    [
      'SPRITE',
      'DRINKS',
      80,
      AssetImage('assets/images/ambot.png'),
    ],
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter the menu items based on the search query
    List<List<dynamic>> filteredMenu = menu.where((item) {
      String itemName = item[0].toString().toLowerCase();
      String categoryName = item[1].toString().toLowerCase();
      String query = searchQuery.toLowerCase();

      return itemName.contains(query) || categoryName.contains(query);
    }).toList();

    // Group the filtered menu items by category
    Map<String, List<dynamic>> menuByCategory = {};
    for (var item in filteredMenu) {
      String category = item[1];
      if (menuByCategory.containsKey(category)) {
        menuByCategory[category]!.add(item);
      } else {
        menuByCategory[category] = [item];
      }
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFa02e49),
          title: Text('PRODUCTS'),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              icon: Icon(Icons.arrow_back, color: Colors.white))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Color(0xFFa02e49)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFa02e49).withOpacity(0.1),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFa02e49), width: 2.0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFa02e49), width: 2.0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Color(0xFFa02e49)),
                      prefixIcon: Icon(Icons.search, color: Color(0xFFa02e49)),
                      prefixIconConstraints: BoxConstraints(minWidth: 40),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddProductPage(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      children: [
                        Icon(Icons.add_circle, color: Color(0xFFa02e49)),
                        Text(
                          'Add Product',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFFa02e49)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: menuByCategory.keys.length,
                itemBuilder: (context, index) {
                  String category = menuByCategory.keys.elementAt(index);
                  List<dynamic> items = menuByCategory[category]!;

                  return Column(
                    children: [
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(
                                    0xFFa02e49,
                                  ),
                                  fontSize: 20),
                            ),
                            Divider(
                                color: Color(
                              0xFFa02e49,
                            )),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          String itemName = items[index][0];
                          int price = items[index][2];
                          AssetImage image = items[index][3];

                          return ListTile(
                            leading: Image(image: image),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(itemName,
                                    style: TextStyle(
                                        color: Color(
                                      0xFFa02e49,
                                    ))),
                                Text(
                                  '₱${price.toString()}',
                                  style: TextStyle(
                                      color: Color(
                                        0xFFa02e49,
                                      ),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete,
                                    color: Color(
                                      0xFFa02e49,
                                    ))),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
