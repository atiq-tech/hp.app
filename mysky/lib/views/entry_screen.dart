import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mysky/Api_integration/api_get_area.dart';
import 'package:mysky/otp_screen.dart';
import 'package:mysky/providers/counter_probider.dart';
import 'package:mysky/widget/button.dart';
import 'package:provider/provider.dart';
import '../widget/gap_height.dart';

class EntryScreen extends StatefulWidget {
  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _DataSellController = TextEditingController();
final TextEditingController _rechargeController = TextEditingController();
final TextEditingController _GiftController = TextEditingController();
final TextEditingController _fiveQuestionController = TextEditingController();
final TextEditingController _seventhQuestionController =
    TextEditingController();

String? _newSim;
String? _bLApp;
String? _toffeeApp;
String? _recharge;
String? _gift;
String? _dataCell;
bool _dataCellFieldVisible = false;
bool _rechargeFieldVisible = false;
bool _giftFieldVisible = false;
bool _textFieldVisible = false;

String? _selectedArea;
List<String> _items = ["Dhaka", "Pabna", "Kustia"];

enum QuestionAns {
  Veryhappy,
  Somewhathappy,
  Neitherhappyorunhappy,
  Somewhatunhappy,
  Veryunhappy,
}

enum SixthQuestionAns {
  Verysatisfied,
  Satisfied,
  Disssatisfied,
  Verydissatisfied,
}

String? firstQuestionAns;
String? SecondQuestionAns;
String? thirdQuestionAns;
String? fourthQuestionAns;
String? sixthQuestionAns;

class _EntryScreenState extends State<EntryScreen> {
  ApiAllGetArea? apiAllGetArea;

  @override
  void initState() {
    ApiAllGetArea apiAllGetArea;
    Provider.of<CounterProvider>(context, listen: false).getArea(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final allGetAreaData =
        Provider.of<CounterProvider>(context).allGetAreaslist;
    //print("aaaaaaaaaaa==========>${allGetAreaData}");
    return GestureDetector(
      onTap: () {
        // FocusManager.instance.primaryFocus?.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //This Row is Enter Name
                Row(
                  children: [
                    const Expanded(
                      flex: 6,
                      child: Text("Enter Name"),
                    ),
                    Expanded(
                      flex: 7,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                        child: TextField(
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: "Enter Name",
                            hintStyle: TextStyle(color: Colors.black26),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.transparent),
                // This Row is Moblie Number
                Row(
                  children: [
                    const Expanded(
                      flex: 6,
                      child: Text("Mobile Number"),
                    ),
                    Expanded(
                      flex: 7,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                        child: TextField(
                          controller:
                              _phoneController, //ei controller e phone number debo then sa
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: "Mobile Number",
                            hintStyle: TextStyle(color: Colors.black26),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.transparent),
                // This Row is Buy New Sim?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Text("Buy New Sim?"),
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          Radio(
                            value: "yes",
                            groupValue: _newSim,
                            activeColor: Colors.teal,
                            onChanged: (value) {
                              setState(() {
                                _newSim = value!;
                                print("NewSimValue============>$value");
                              });
                            },
                          ),
                          const Text("Yes"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Radio(
                            value: "no",
                            groupValue: _newSim,
                            activeColor: Colors.teal,
                            onChanged: (value) {
                              setState(() {
                                _newSim = value!;
                                print("NewSimValue============>$value");
                              });
                            },
                          ),
                          const Text("No"),
                        ],
                      ),
                    ),
                  ],
                ),
                // This Row is MyBL App Install?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Text("MyBL App Install?"),
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          Radio(
                            value: "yes",
                            groupValue: _bLApp,
                            activeColor: Colors.teal,
                            onChanged: (value) {
                              setState(() {
                                _bLApp = value;
                                print("bLApp Value============>$value");
                              });
                            },
                          ),
                          const Text("Yes"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Radio(
                            value: "no",
                            groupValue: _bLApp,
                            activeColor: Colors.teal,
                            onChanged: (value) {
                              setState(() {
                                _bLApp = value;
                                print("bLApp Value============>$value");
                              });
                            },
                          ),
                          const Text("No"),
                        ],
                      ),
                    ),
                  ],
                ),
                // This Row is Toffee App Install?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Text("Toffee App Install?"),
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          Radio(
                            value: "yes",
                            groupValue: _toffeeApp,
                            activeColor: Colors.teal,
                            onChanged: (value) {
                              setState(() {
                                _toffeeApp = value;
                                print("toffeeApp=======$value");
                              });
                            },
                          ),
                          const Text("Yes"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Radio(
                            value: "no",
                            groupValue: _toffeeApp,
                            activeColor: Colors.teal,
                            onChanged: (value) {
                              setState(() {
                                _toffeeApp = value;
                                print("toffeeApp=======$value");
                              });
                            },
                          ),
                          const Text("No"),
                        ],
                      ),
                    ),
                  ],
                ),
                // This Row is Data Sell Package? vai achen?

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Text("Data Sell Package?"),
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          Radio(
                              value: "yes",
                              groupValue: _dataCell,
                              activeColor: Colors.teal,
                              onChanged: (value) {
                                setState(() {
                                  _dataCell = value;
                                  _dataCellFieldVisible = value == "yes";
                                  print("_dataCell========>$value");
                                });
                              }),
                          const Text("Yes"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Radio(
                              value: "no",
                              groupValue: _dataCell,
                              activeColor: Colors.teal,
                              onChanged: (value) {
                                setState(() {
                                  _dataCell = value;
                                  print("_dataCell========>$value");
                                });
                              }),
                          const Text("No"),
                        ],
                      ),
                    ),
                  ],
                ),
                if (_dataCell == "yes")
                  Row(
                    children: [
                      const Expanded(
                        flex: 6,
                        child: Text("Data Sell (GB)"),
                      ),
                      Expanded(
                        flex: 7,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextField(
                            controller: _DataSellController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'GB',
                              hintStyle: TextStyle(color: Colors.black45),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                // This Row is Recharge Package?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Text("Recharge Package?"),
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          Radio(
                              value: "yes",
                              groupValue: _recharge,
                              activeColor: Colors.teal,
                              onChanged: (value) {
                                setState(() {
                                  _recharge = value;
                                  _rechargeFieldVisible = value == "yes";
                                  print("_recharge========>$value");
                                });
                              }),
                          const Text("Yes"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Radio(
                            value: "no",
                            groupValue: _recharge,
                            activeColor: Colors.teal,
                            onChanged: (value) {
                              setState(() {
                                _recharge = value;
                                print("_recharge========>$value");
                              });
                            },
                          ),
                          const Text("No"),
                        ],
                      ),
                    ),
                  ],
                ),
                if (_recharge == "yes")
                  Row(
                    children: [
                      const Expanded(
                        flex: 6,
                        child: Text("Recharge (Amount)"),
                      ),
                      Expanded(
                        flex: 7,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextField(
                            controller: _rechargeController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Amount',
                              hintStyle: TextStyle(color: Colors.black45),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                // This Row is Gift Item?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 7,
                      child: Text("Gift Item?"),
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          Radio(
                            value: "yes",
                            groupValue: _gift,
                            activeColor: Colors.teal,
                            onChanged: (value) {
                              setState(() {
                                _gift = value;
                                _giftFieldVisible = value == " yes";
                                print(" _gift========>$value");
                              });
                            },
                          ),
                          const Text("Yes"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Radio(
                            value: "no",
                            groupValue: _gift,
                            activeColor: Colors.teal,
                            onChanged: (value) {
                              setState(() {
                                _gift = value;
                                print(" _gift========>$value");
                              });
                            },
                          ),
                          const Text("No"),
                        ],
                      ),
                    ),
                  ],
                ),
                if (_gift == "yes")
                  Row(
                    children: [
                      const Expanded(
                        flex: 6,
                        child: Text("Gift Name"),
                      ),
                      Expanded(
                        flex: 7,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          child: TextField(
                            controller: _GiftController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Gift Name',
                              hintStyle: TextStyle(color: Colors.black45),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                const Divider(color: Colors.transparent),
                //This Row is Select Area
                Row(
                  children: [
                    const Expanded(
                      flex: 6,
                      child: Text("Select Area"),
                    ),
                    Expanded(
                      flex: 11,
                      child: Container(
                        height: 30.0,
                        width: MediaQuery.of(context).size.width / 2,
                        padding: EdgeInsets.only(left: 5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 5, 107, 155),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            hint: Text(
                              'Select area',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            dropdownColor: Color.fromARGB(255, 231, 251,
                                255), // Not necessary for Option 1
                            value: _selectedArea,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedArea = newValue!.toString();
                                // print("Area name is======$_selectedArea");
                              });
                            },
                            items: allGetAreaData.map((location) {
                              return DropdownMenuItem(
                                child: Text(
                                  "${location.name}",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                value: location.id,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                gapHeight(height: 10.0),
                // This Column 1st Question ?
                gapHeight(height: 10.0),
                Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.black87,
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            "How do you feel about this program of Banglalink?",
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Very happy",
                            groupValue: firstQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                firstQuestionAns = value;
                                print("firstQuestionAns=======>$value");
                              });
                            }),
                        const Text("Very happy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Somewhat happy",
                            groupValue: firstQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                firstQuestionAns = value;
                                print("firstQuestionAns=======>$value");
                              });
                            }),
                        const Text("Somewhat happy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Neither happy or unhappy",
                            groupValue: firstQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                firstQuestionAns = value;
                                print("firstQuestionAns=======>$value");
                              });
                            }),
                        const Text("Neither happy or unhappy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Somewhat unhappy",
                            groupValue: firstQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                firstQuestionAns = value;
                                print("firstQuestionAns=======>$value");
                              });
                            }),
                        const Text("Somewhat unhappy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Very unhappy",
                            groupValue: firstQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                firstQuestionAns = value;
                                print("firstQuestionAns=======>$value");
                              });
                            }),
                        const Text("Very unhappy"),
                      ],
                    ),
                  ],
                ),
                //const Divider(color: Colors.transparent),
                gapHeight(height: 10.0),
                // This Column 2nd Question ?
                gapHeight(height: 10.0),
                const Divider(color: Colors.transparent),
                Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.black87,
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            "How do you like about BL 4G experience ?",
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Very happy",
                            groupValue: SecondQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                SecondQuestionAns = value;
                                print("SecondQuestionAns=======>$value");
                              });
                            }),
                        const Text("Very happy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Somewhat happy",
                            groupValue: SecondQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                SecondQuestionAns = value;
                                print("SecondQuestionAns=======>$value");
                              });
                            }),
                        const Text("Somewhat happy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Neither happy or unhappy",
                            groupValue: SecondQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                SecondQuestionAns = value;
                                print("SecondQuestionAns=======>$value");
                              });
                            }),
                        const Text("Neither happy or unhappy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Somewhat unhappy",
                            groupValue: SecondQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                SecondQuestionAns = value;
                                print("SecondQuestionAns=======>$value");
                              });
                            }),
                        const Text("Somewhat unhappy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Very unhappy",
                            groupValue: SecondQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                SecondQuestionAns = value;
                                print("SecondQuestionAns=======>$value");
                              });
                            }),
                        const Text("Very unhappy"),
                      ],
                    ),
                  ],
                ),
                // This Column 3rd Question ?
                gapHeight(height: 10.0),
                const Divider(color: Colors.transparent),
                Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.black87,
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            " How do you like about My BL app experience ?",
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Very happy",
                            groupValue: thirdQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                thirdQuestionAns = value;
                                print("thirdQuestionAns=======>$value");
                              });
                            }),
                        const Text("Very happy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Somewhat happy",
                            groupValue: thirdQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                thirdQuestionAns = value;
                                print("thirdQuestionAns=======>$value");
                              });
                            }),
                        const Text("Somewhat happy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Neither happy or unhappy",
                            groupValue: thirdQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                thirdQuestionAns = value;
                                print("thirdQuestionAns=======>$value");
                              });
                            }),
                        const Text("Neither happy or unhappy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Somewhat unhappy",
                            groupValue: thirdQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                thirdQuestionAns = value;
                                print("thirdQuestionAns=======>$value");
                              });
                            }),
                        const Text("Somewhat unhappy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Very unhappy",
                            groupValue: thirdQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                thirdQuestionAns = value;
                                print("thirdQuestionAns=======>$value");
                              });
                            }),
                        const Text("Very unhappy"),
                      ],
                    ),
                  ],
                ),
                gapHeight(height: 10.0),
                const Divider(color: Colors.transparent),
                // This Column 4th Question ?
                Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.black87,
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            "How do you like about BL gaming experience ?",
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Very happy",
                            groupValue: fourthQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                fourthQuestionAns = value;
                                print("fourthQuestionAns=======>$value");
                              });
                            }),
                        const Text("Very happy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Somewhat happy",
                            groupValue: fourthQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                fourthQuestionAns = value;
                                print("fourthQuestionAns=======>$value");
                              });
                            }),
                        const Text("Somewhat happy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Neither happy or unhappy",
                            groupValue: fourthQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                fourthQuestionAns = value;
                                print("fourthQuestionAns=======>$value");
                              });
                            }),
                        const Text("Neither happy or unhappy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Somewhat unhappy",
                            groupValue: fourthQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                fourthQuestionAns = value;
                                print("fourthQuestionAns=======>$value");
                              });
                            }),
                        const Text("Somewhat unhappy"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Very unhappy",
                            groupValue: fourthQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                fourthQuestionAns = value;
                                print("fourthQuestionAns=======>$value");
                              });
                            }),
                        const Text("Very unhappy"),
                      ],
                    ),
                  ],
                ),
                gapHeight(height: 10.0),
                const Divider(color: Colors.transparent),
                // This Column 5th Question ?
                Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.black87,
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            "What do you think, what other features can be added to this type of event?",
                            softWrap: false,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.transparent),
                    TextField(
                      controller: _fiveQuestionController,
                      keyboardType: TextInputType.text,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                const Divider(color: Colors.transparent),
                // This Column 6th Question ?
                Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.black87,
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            "Are you satisfied with Banglalink’s overall service?",
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Very satisfied",
                            groupValue: sixthQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                sixthQuestionAns = value;
                                print("sixthQuestionAns=======>$value");
                              });
                            }),
                        const Text("Very satisfied"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Satisfied",
                            groupValue: sixthQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                sixthQuestionAns = value;
                                print("sixthQuestionAns=======>$value");
                              });
                            }),
                        const Text("Satisfied"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Dissatisfied",
                            groupValue: sixthQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                sixthQuestionAns = value;
                                print("sixthQuestionAns=======>$value");
                              });
                            }),
                        const Text("Dissatisfied"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "Very dissatisfied",
                            groupValue: sixthQuestionAns,
                            onChanged: (value) {
                              setState(() {
                                sixthQuestionAns = value;
                                print("sixthQuestionAns=======>$value");
                              });
                            }),
                        const Text("Very dissatisfied"),
                      ],
                    ),
                  ],
                ),
                gapHeight(height: 10.0),
                const Divider(color: Colors.transparent),
                // This Column 7th Question ?
                Column(
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor: Colors.black87,
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            "Where do you want to see Bangllink as a brand in the future?",
                            softWrap: false,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.transparent),
                    TextField(
                      controller: _seventhQuestionController,
                      keyboardType: TextInputType.text,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                gapHeight(height: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color.fromARGB(255, 46, 46, 46), width: 2),
                        ),
                        elevation: 10.0,
                        child: images == null
                            ? Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSe5grOHHHCKNR15MLoms5LIbhrgdB2rq6IOw&usqp=CAU",
                                height: 200,
                                width: 220,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(images!),
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              )),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _imageSource = ImageSource.camera;
                          _getImage();
                        },
                        child: Text(
                          "Select camera",
                          style: TextStyle(
                              color: Color.fromARGB(255, 249, 254, 255),
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        )),
                  ],
                ),
                gapHeight(height: 20.0),
                PurpleButton(
                  "Save",
                  () {
                    fetchOtpGet();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  fetchOtpGet() async {
    String link = "http://apps.bigerp24.com/api/save_data";
    var formData = FormData.fromMap({
      "name": "${_nameController.text}",
      "mobile": "${_phoneController.text}",
      "new_sim": "$_newSim",
      "app_install": "$_bLApp",
      "toffee": "$_toffeeApp",
      "sell_package": "$_dataCell",
      "sell_gb": _DataSellController.text,
      "recharge_package": "$_recharge",
      "recharge_amount": _rechargeController.text,
      "gift": "$_gift",
      "gift_name": "${_GiftController.text}",
      "area_id": "$_selectedArea",
      "location": "dhaka",
      "program": "$firstQuestionAns",
      "experience": "$SecondQuestionAns",
      "app_experience": "$thirdQuestionAns",
      "gaming": "$fourthQuestionAns",
      "event": "${_fiveQuestionController.text}",
      "service": "$sixthQuestionAns",
      "future": "${_seventhQuestionController.text}"
    });
    try {
      Response response = await Dio().post(link, data: formData);
      print(response.data);

      print("message============> ${response.data["message"]}");
      print(" mobile =================> ${response.data["mobile"]}");
      print("otpCode================>  ${response.data["otpCode"]}");
      getmessage = "${response.data["message"]}";
      getmobilenumber = "${response.data["mobile"]}";
      getotp = "${response.data["otpCode"]}";
      if ("${response.data["mobile"]}" == "null") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Your mobile number")));
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OTPScreen(
              phoneNumber: getmobilenumber,
              api_otp: getotp,
            ),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  String? getmessage;
  String? getmobilenumber;
  String? getotp;

  String? images;
  ImageSource _imageSource = ImageSource.camera;

  void _getImage() async {
    final selectedImage = await ImagePicker().pickImage(source: _imageSource);
    if (selectedImage != null) {
      setState(() {
        images = selectedImage.path;
      });
    }
  }
}
