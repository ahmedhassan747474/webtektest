import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/api.dart';
import 'package:untitled/help.dart';
import 'package:z_date_range_picker/date_range_picker.dart';

import 'model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 2;
  bool _isLoading = true;
  List<Launches> list = [];
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    // if (_isLogin)
    list = await ApiProvider.instance.launchRequest();
    // widget.restaurants.addAll(restaurants.data);
    // print(_isLogin);
    _isLoading = false;
    if (mounted) setState(() {});
  }

  void showCustomRangePicker() async {
    var res = await showTCRDateRangePicker(
      context: context,
      // selectRange: CustomDateTimeRange(start: DateTime.now(), end: DateTime.now().add(Duration(days: 6))),
      selectRange: CustomDateTimeRange(),
      validRange:
          CustomDateTimeRange(start: DateTime(2021, 1), end: DateTime(2022, 7)),
    );

    print('res = $res');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Home"),
        centerTitle: true,
        leading: IconButton(
            onPressed: showCustomRangePicker,
            icon: Icon(Icons.date_range_sharp)),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 10, bottom: 15),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: helpClip(
                8,
                Container(
                  decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 245, 245, 245),
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0))),
                  child: Column(
                    children: [
                      Container(
                          height: 100,
                          width: 100,
                          child: helpImage(list[index].links.patch.small, 5)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(list[index].name),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(DateFormat.yMEd().format(
                          list[index].staticFireDateUtc ?? DateTime.now())),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
