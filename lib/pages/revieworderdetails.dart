import 'package:flutter/material.dart';
import 'package:user/pages/payment.dart';

class ReviewOrderDetails extends StatefulWidget {
  const ReviewOrderDetails({super.key});

  @override
  State<ReviewOrderDetails> createState() => _ReviewOrderDetailsState();
}

class _ReviewOrderDetailsState extends State<ReviewOrderDetails> {
  List<List<dynamic>> order = [
    [
      'Tapsilog',
      15,
      1,
      [
        ['addon1', 15, 1],
        ['addon2', 15, 3]
      ]
    ],
    [
      'Hotsilog',
      15,
      1,
      [
        ['addon1', 10, 1],
        ['addon2', 10, 2]
      ]
    ],
  ];

  bool last = false;

  List<List<dynamic>> addons = [];

  double grandtotal = 0.0;

  double calculateTotalAmount(List<List<dynamic>> order) {
    double totalAmount = 0.0;

    for (int i = 0; i < order.length; i++) {
      double itemPrice = double.parse(order[i][1].toString());
      int itemQuantity = order[i][2];
      totalAmount += itemPrice * itemQuantity;

      List<List<dynamic>> addons = order[i][3];
      for (int j = 0; j < addons.length; j++) {
        double addonPrice = double.parse(addons[j][1].toString());
        int addonQuantity = addons[j][2];
        totalAmount += addonPrice * addonQuantity;
      }
    }

    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFa02e49),
        title: Text('DETAILS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xFFa02e49)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFa02e49)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Marites',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFa02e49),
                                  fontSize: 18),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'TBL#',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFa02e49)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Table 1',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFa02e49),
                                  fontSize: 18),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      top: BorderSide(width: 2, color: Color(0xFFa02e49)),
                    )),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Text(
                                  'PRODUCT',
                                  style: TextStyle(
                                      color: Color(0xFFa02e49),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Text(
                                  'QTY',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFFa02e49),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Text(
                                  'PRICE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFFa02e49),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Text(
                                  'SUBTOTAL',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFFa02e49),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Divider(thickness: 2, color: Color(0xFFa02e49)),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: ListView.builder(
                              itemCount: order.length,
                              itemBuilder: (context, index) {
                                bool hasaddons = false;

                                if (order.length == index + 1) {
                                  last = true;
                                  print('last');
                                }
                                print(order.length);
                                print(index);
                                List<dynamic> currentOrder = order[index];
                                String productName = currentOrder[0];
                                double price =
                                    double.parse(currentOrder[1].toString());
                                int quantity = currentOrder[2];
                                if (currentOrder[3].length > 0) {
                                  addons = currentOrder[3];
                                  hasaddons = true;
                                }

                                double subtotal = 0.0;
                                subtotal = price * quantity;

                                grandtotal += subtotal;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            child: Text(
                                              productName,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color(0xFFa02e49)),
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            child: Text(
                                              '$quantity',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xFFa02e49)),
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            child: Text(
                                              '₱ $price',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xFFa02e49)),
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            child: Text(
                                              '₱$subtotal',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xFFa02e49)),
                                            )),
                                      ],
                                    ),
                                    if (hasaddons)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Text('Addons:'),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: addons.length,
                                            itemBuilder: (context, index) {
                                              List<dynamic> currentAddon =
                                                  addons[index];
                                              String addonName =
                                                  currentAddon[0];
                                              double addonPrice = double.parse(
                                                  currentAddon[1].toString());
                                              int addonQuantity =
                                                  currentAddon[2];

                                              double addonSubtotal = 0.0;
                                              addonSubtotal =
                                                  addonPrice * addonQuantity;

                                              grandtotal +=
                                                  addonPrice * addonQuantity;
                                              return Padding(
                                                padding:
                                                    EdgeInsets.only(left: 16.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.28,
                                                      child: Text(
                                                        '$addonName',
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.21,
                                                      child: Text(
                                                        '$addonQuantity',
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.17,
                                                      child: Text(
                                                        '₱$addonPrice',
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.19,
                                                      child: Text(
                                                        '₱$addonSubtotal',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    Divider(
                                        thickness: 1, color: Color(0xFFa02e49)),
                                    if (last)
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'TOTAL',
                                                style: TextStyle(
                                                    color: Color(0xFFa02e49),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Text('',
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xFFa02e49))),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                child: Text(
                                                    '₱${calculateTotalAmount(order)}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFFa02e49))),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'NOTES:',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFFa02e49)),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color: Color(0xFFa02e49)),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Text(
                                                'Paki-overcook!',
                                                style: TextStyle(
                                                    color: Color(0xFFa02e49)),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFFa02e49))),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PaymentPage(),
                              ),
                            );
                          },
                          child: Text('CONFIRM')),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
