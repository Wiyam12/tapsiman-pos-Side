import 'package:flutter/material.dart';

class AddOrderPage extends StatefulWidget {
  const AddOrderPage({super.key});

  @override
  State<AddOrderPage> createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  List<List<dynamic>> addon = [
    ['EGG', 15],
    ['RICE', 15],
    ['GRAVY', 15],
  ];

  List<String> notes = [
    'POGI',
    'CUTE',
    'POGI',
    'CUTE',
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFa02e49),
        title: Text('SELECT ADDONS BELOW', style: TextStyle(fontSize: 12)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'STOCKS',
                  style: TextStyle(fontSize: 10),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    child: Text('200'),
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
            SingleChildScrollView(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('PRODUCT',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFa02e49))),
                    Text(':',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFa02e49))),
                    Expanded(
                        child: Text(
                      'TAPSILOG',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFa02e49)),
                      textAlign: TextAlign.end,
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 100,
                        child: Text('PRICE',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFa02e49)))),
                    Text(':',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFa02e49))),
                    Expanded(
                        child: Text(
                      '₱100.0',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFa02e49)),
                      textAlign: TextAlign.end,
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 100,
                        child: Text('QTY',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFa02e49)))),
                    Text(':',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFa02e49))),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 40,
                          width: 100,
                          // width: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Color(0xFFa02e49)),
                              borderRadius: BorderRadius.circular(10)),

                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                color: Color(0xFFa02e49),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                '0',
                                textAlign: TextAlign.center,
                              )),
                              Container(
                                height: double.infinity,
                                color: Color(0xFFa02e49),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                  color: Color(0xFFa02e49),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'ENTER NOTE:',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFa02e49)),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  style: TextStyle(color: Color(0xFFa02e49)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Color(0xFFa02e49)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFa02e49), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFa02e49), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(
                //       'SELECT ADDON',
                //       style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //           color: Color(0xFFa02e49)),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.33,
                //   child: ListView.builder(
                //     // scrollDirection: Axis.vertical,
                //     itemCount: addon.length,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: const EdgeInsets.symmetric(vertical: 8),
                //         child: Container(
                //           width: double.infinity,
                //           decoration: BoxDecoration(
                //               border: Border.all(
                //                 width: 2,
                //                 color: Color(0xFFa02e49),
                //               ),
                //               borderRadius: BorderRadius.circular(10)),
                //           height: 70,
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Text(
                //                   'EGG',
                //                   style: TextStyle(
                //                       color: Color(0xFFa02e49),
                //                       fontSize: 18,
                //                       fontWeight: FontWeight.bold),
                //                 ),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(8.0),
                //                 child: Container(
                //                   width: 100,
                //                   height: 45,
                //                   decoration: BoxDecoration(
                //                       border: Border.all(
                //                         width: 2,
                //                         color: Color(0xFFa02e49),
                //                       ),
                //                       borderRadius: BorderRadius.circular(10)),
                //                   child: Row(
                //                     children: [
                //                       Container(
                //                         height: double.infinity,
                //                         color: Color(0xFFa02e49),
                //                         child: Padding(
                //                           padding: const EdgeInsets.all(5.0),
                //                           child: Icon(
                //                             Icons.remove,
                //                             size: 15,
                //                             color: Colors.white,
                //                           ),
                //                         ),
                //                       ),
                //                       Expanded(
                //                           child: Text(
                //                         '0',
                //                         textAlign: TextAlign.center,
                //                       )),
                //                       Container(
                //                         height: double.infinity,
                //                         color: Color(0xFFa02e49),
                //                         child: Padding(
                //                           padding: const EdgeInsets.all(5.0),
                //                           child: Icon(
                //                             Icons.add,
                //                             size: 15,
                //                             color: Colors.white,
                //                           ),
                //                         ),
                //                       )
                //                     ],
                //                   ),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Divider(
                //   thickness: 2,
                //   color: Color(0xFFa02e49),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(
                //       'SELECT NOTE',
                //       style: TextStyle(
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //           color: Color(0xFFa02e49)),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 40.0,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: notes.length,
                //     itemBuilder: (context, index) {
                //       bool isSelected = selectedIndex == index;
                //       Color backgroundColor =
                //           isSelected ? Color(0xFFa02e49) : Colors.white;
                //       Color textColor =
                //           isSelected ? Colors.white : Color(0xFFa02e49);

                //       return Padding(
                //         padding: const EdgeInsets.all(4.0),
                //         child: ElevatedButton(
                //           onPressed: () {
                //             setState(() {
                //               selectedIndex = index;
                //             });
                //           },
                //           style: ButtonStyle(
                //             backgroundColor: MaterialStateProperty.all<Color>(
                //                 backgroundColor),
                //           ),
                //           child: Text(
                //             notes[index],
                //             style: TextStyle(color: textColor),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFFa02e49))),
                          onPressed: () {},
                          child: Text('CANCEL')),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFFa02e49))),
                          onPressed: () {},
                          child: Text('CONFIRM')),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
