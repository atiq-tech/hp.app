import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DataListScreen extends StatefulWidget {
  const DataListScreen({super.key});

  @override
  State<DataListScreen> createState() => _DataListScreenState();
}

class _DataListScreenState extends State<DataListScreen> {
  final TextEditingController _DateController = TextEditingController();
  final TextEditingController _Date2Controller = TextEditingController();
  String? firstPickedDate;

  void _firstSelectedDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (selectedDate != null) {
      setState(() {
        firstPickedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  String? secondPickedDate;

  void _secondSelectedDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (selectedDate != null) {
      setState(() {
        secondPickedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  bool isSupplierListClicked = false;
  bool isTeamListClicked = false;
  bool isBpListClicked = false;
  String? _searchType;

  List<String> _searchTypeList = [
    'All',
    'By Area',
    'Team Leader',
    'By Bp',
  ];
  String? _selectedArea;
  List<String> _selectedAreaList = [
    'Dhaka',
    'Mirpur-10',
    'Dhanmondi-32',
    'Gulistan',
  ];
  String? _selectedTeamLeader;
  List<String> _selectedTeamLeaderList = [
    'Atiq',
    'Rana',
    'Rony',
  ];
  String? _selectedBp;
  List<String> _selectedBpList = [
    'Maheem',
    'Tanim',
    'Sakib',
  ];

  @override
  void initState() {
    firstPickedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    secondPickedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data List"),
      ),
      body: Container(
        padding: EdgeInsets.all(6),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 210.0,
                width: double.infinity,
                padding: EdgeInsets.only(top: 6.0, left: 10.0, right: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 5, 107, 155),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              "Search Type",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(flex: 1, child: Text(":")),
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
                                  hint: Text(
                                    'All',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  dropdownColor: Color.fromARGB(255, 231, 251,
                                      255), // Not necessary for Option 1
                                  value: _searchType,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _searchType = newValue!;
                                      _searchType == "By Area"
                                          ? isSupplierListClicked = true
                                          : isSupplierListClicked = false;
                                      _searchType == "Team Leader"
                                          ? isTeamListClicked = true
                                          : isTeamListClicked = false;
                                      _searchType == "By Bp"
                                          ? isBpListClicked = true
                                          : isBpListClicked = false;
                                    });
                                  },
                                  items: _searchTypeList.map((location) {
                                    return DropdownMenuItem(
                                      child: Text(
                                        maxLines: 1,
                                        location,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.0),
                    isSupplierListClicked == true
                        ? Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                Container(
                                  height: 30.0,
                                  width: MediaQuery.of(context).size.width / 2 +
                                      50,
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
                                        'Select Area',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      dropdownColor: Color.fromARGB(
                                          255,
                                          231,
                                          251,
                                          255), // Not necessary for Option 1
                                      value: _selectedArea,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedArea = newValue.toString();
                                        });
                                      },
                                      items: _selectedAreaList.map((location) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            overflow: TextOverflow.visible,
                                            maxLines: 1,
                                            location,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          value: location,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    isTeamListClicked == true
                        ? Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                Container(
                                  height: 30.0,
                                  width: MediaQuery.of(context).size.width / 2 +
                                      50,
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
                                        'Select Team Leader',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      dropdownColor: Color.fromARGB(
                                          255,
                                          231,
                                          251,
                                          255), // Not necessary for Option 1
                                      value: _selectedTeamLeader,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedTeamLeader =
                                              newValue.toString();
                                        });
                                      },
                                      items: _selectedTeamLeaderList
                                          .map((location) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            overflow: TextOverflow.visible,
                                            maxLines: 1,
                                            location,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          value: location,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    isBpListClicked == true
                        ? Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                Container(
                                  height: 30.0,
                                  width: MediaQuery.of(context).size.width / 2 +
                                      50,
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
                                        'Select Bp',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      dropdownColor: Color.fromARGB(
                                          255,
                                          231,
                                          251,
                                          255), // Not necessary for Option 1
                                      value: _selectedBp,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedBp = newValue.toString();
                                        });
                                      },
                                      items: _selectedBpList.map((location) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            overflow: TextOverflow.visible,
                                            maxLines: 1,
                                            location,
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          value: location,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    SizedBox(height: 6.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "From",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(flex: 1, child: Text(":")),
                        Expanded(
                          flex: 11,
                          child: Container(
                            height: 35,
                            child: GestureDetector(
                              onTap: (() {
                                _firstSelectedDate();
                              }),
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 10, left: 5),
                                  filled: true,
                                  fillColor: Colors.blue[50],
                                  suffixIcon: Icon(
                                    Icons.calendar_month,
                                    color: Colors.black87,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: firstPickedDate == null
                                      ? DateFormat('yyyy-MM-dd')
                                          .format(DateTime.now())
                                      : firstPickedDate,
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "Date To",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(flex: 1, child: Text(":")),
                        Expanded(
                          flex: 11,
                          child: Container(
                            height: 35,
                            child: GestureDetector(
                              onTap: (() {
                                _secondSelectedDate();
                              }),
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 10, left: 5),
                                  filled: true,
                                  fillColor: Colors.blue[50],
                                  suffixIcon: Icon(
                                    Icons.calendar_month,
                                    color: Colors.black87,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: secondPickedDate == null
                                      ? DateFormat('yyyy-MM-dd')
                                          .format(DateTime.now())
                                      : secondPickedDate,
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          height: 35.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 75, 196, 201),
                                width: 2.0),
                            color: Color.fromARGB(255, 87, 113, 170),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Center(
                              child: Text(
                            "Search",
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: MediaQuery.of(context).size.height / 1.43,
                width: double.infinity,
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        // color: Colors.red,
                        // padding:EdgeInsets.only(bottom: 16.0),
                        child: DataTable(
                          showCheckboxColumn: true,
                          border:
                              TableBorder.all(color: Colors.black54, width: 1),
                          columns: [
                            DataColumn(
                              label: Center(child: Text('Invoice No.')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Date')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Supplier Id')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Supplier Name')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Sub Total')),
                            ),
                            DataColumn(
                              label: Center(child: Text('VAT')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Total')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Paid')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Due')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Note')),
                            ),
                          ],
                          rows: List.generate(
                            10,
                            (int index) => DataRow(
                              cells: <DataCell>[
                                DataCell(
                                  Center(child: Text('$index')),
                                ),
                                DataCell(
                                  Center(child: Text('$index')),
                                ),
                                DataCell(
                                  Center(child: Text('$index')),
                                ),
                                DataCell(
                                  Center(child: Text('$index')),
                                ),
                                DataCell(
                                  Center(child: Text('$index')),
                                ),
                                DataCell(
                                  Center(child: Text('$index')),
                                ),
                                DataCell(
                                  Center(child: Text('$index')),
                                ),
                                DataCell(
                                  Center(child: Text('$index')),
                                ),
                                DataCell(
                                  Center(child: Text('$index')),
                                ),
                                DataCell(
                                  Center(child: Text('$index')),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
