import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sempolita_kreanova_app/models/record.dart';
import 'package:sempolita_kreanova_app/services/myserverconfig.dart';
import 'package:sempolita_kreanova_app/shared/loading.dart';
import 'package:sempolita_kreanova_app/views/dashboard/iot/detail_iot_page.dart';

class IotPage extends StatefulWidget {
  @override
  State<IotPage> createState() => _IotPage();
}

class _IotPage extends State<IotPage> {
  bool _isLoading = false;
  final TextEditingController _idKoperController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void _checkKoper(BuildContext context) {
    setState(() {
      _isLoading = true;
    });
    String _idKoper = _idKoperController.text;

    http.get(
        Uri.parse(
            "${MyServerConfig.server}/api/v1/record_latest?box_id=$_idKoper"),
        headers: {"Content-Type": "application/json"}).then((response) {
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        RecordData record = RecordData.fromJson(responseData);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (content) => DetailIot(
              boxId: record.boxId,
              weight: record.weight,
              length: record.length,
              id: record.id,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("ID Koper Tidak Ditemukan"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }).whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double lebarLayar = MediaQuery.of(context).size.width;
    double tinggiLayar = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(top: 50, bottom: 10),
          child: Text('Integrasi Internet Of Things'),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 100,
        color: Color(0xFFFFFFFF), // Change background color
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: _isLoading
              ? LoadingIndicator()
              : ElevatedButton(
                  onPressed: () {
                    _checkKoper(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 50), // Adjust size as needed
                    padding: EdgeInsets.all(0), // No padding
                    primary: Color(0xFF31C48D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    'Ambil Data Balita',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: lebarLayar,
            height: 500,
            padding: const EdgeInsets.only(top: 30),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: Container(
                      width: 375,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 375,
                                  height: 28,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          child: Text(
                                            'ID Koper Kesehatan',
                                            style: TextStyle(
                                              color: Color(0xFF333333),
                                              fontSize: 14,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w600,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 2,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: TextFormField(
                                              controller: _idKoperController,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                              ),
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
