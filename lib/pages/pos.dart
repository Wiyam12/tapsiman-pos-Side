import 'dart:math';

import 'package:flutter/material.dart';
import 'package:user/pages/addnoninventory.dart';
import 'package:user/pages/addorder.dart';
import 'package:user/pages/home.dart';
import 'package:user/pages/review.dart';

class PosPage extends StatefulWidget {
  const PosPage({super.key});

  @override
  State<PosPage> createState() => _PosPageState();
}

class _PosPageState extends State<PosPage> {
  List<String> buttonLabels = ['TAPSI', 'BEVERAGES', 'ADD ON'];
  int selectedIndex = 0;

  List<List<dynamic>> menu = [
    ['TAPSILOG', 'TAPSI', AssetImage('assets/images/POS-tapsilog.jpg')],
    ['BANGSILOG', 'TAPSI', AssetImage('assets/images/POS-bangsilog.jpg')],
    ['TOCILOG', 'TAPSI', AssetImage('assets/images/POS-tocilog.jpg')],
    ['LECHON SILOG', 'TAPSI', AssetImage('assets/images/POS-lechonsilog.jpg')],
    ['LONGSILOG', 'TAPSI', AssetImage('assets/images/POS-longsilog.jpg')],
    ['CHICKSILOG', 'TAPSI', AssetImage('assets/images/POS-chicksilog.jpg')],
    ['CORNSILOG', 'TAPSI', AssetImage('assets/images/POS-cornsilog.jpg')],
    ['HOTSILOG', 'TAPSI', AssetImage('assets/images/POS-hotsilog.jpg')],
    ['SPAMSILOG', 'TAPSI', AssetImage('assets/images/POS-spamsilog.jpg')],
    ['SPRITE', 'BEVERAGES', AssetImage('assets/images/spritecan.jpg')],
    ['COKE', 'BEVERAGES', AssetImage('assets/images/cokecan.jpg')],
    ['RICE', 'ADD ON', AssetImage('assets/images/rice.jpg')],
    ['HOTDOG', 'ADD ON', AssetImage('assets/images/hot.jpg')],
    ['TAPA', 'ADD ON', AssetImage('assets/images/tapa.jpg')],
  ];
  String selectedStatus = 'TAPSI';
  String search = '';
  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> filteredMenu = menu
        .where((item) =>
            search != '' ? item[0].contains(search) : item[1] == selectedStatus)
        .toList();
    print(filteredMenu);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFa02e49),
        title: Text('POS'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'ORDERS',
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    child: Text('0'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: buttonLabels.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndex == index;
                    Color backgroundColor =
                        isSelected ? Color(0xFFa02e49) : Colors.white;
                    Color textColor = isSelected ? Colors.white : Colors.black;

                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        onPressed: () {
                          print(buttonLabels[index]);

                          setState(() {
                            selectedStatus = buttonLabels[index];
                            selectedIndex = index;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(backgroundColor),
                        ),
                        child: Text(
                          buttonLabels[index],
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                child: Row(
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
                            borderSide: BorderSide(
                                color: Color(0xFFa02e49), width: 2.0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFa02e49), width: 2.0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Color(0xFFa02e49)),
                          prefixIcon:
                              Icon(Icons.search, color: Color(0xFFa02e49)),
                          prefixIconConstraints: BoxConstraints(minWidth: 40),
                        ),
                        onChanged: (value) {
                          // String upperValue = value.toUpperCase();
                          setState(() {
                            search = value.toUpperCase();
                          });
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddNonInventory(),
                          ),
                        );
                      },
                      child: Container(
                        width: 80,
                        child: Column(
                          children: [
                            Icon(
                              Icons.add_circle_outline_rounded,
                              color: Color(0xFFa02e49),
                            ),
                            Text(
                              'NON-INVENTORY PRODUCT',
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xFFa02e49)),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Positioned(
              top: 110,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7, // Adjust the aspect ratio as needed
                  ),
                  itemCount: filteredMenu.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddOrderPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: filteredMenu[index][2],
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              color: Color(0xFFa02e49).withOpacity(0.7),
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    filteredMenu[index][0],
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 3, color: Color(0xFFa02e49)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ReviewPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: double.infinity,
                        color: Color(0xFFa02e49),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'REVIEW',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total Amount',
                          style: TextStyle(color: Color(0xFFa02e49)),
                        ),
                        Text('100', style: TextStyle(color: Color(0xFFa02e49))),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Quantity',
                              style: TextStyle(color: Color(0xFFa02e49))),
                          Text('1', style: TextStyle(color: Color(0xFFa02e49))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
