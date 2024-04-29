import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PosyanduData {
  final double bb;
  final double tb;
  final DateTime tanggal;

  PosyanduData({
    required this.bb,
    required this.tb,
    required this.tanggal,
  });
}

class RiwayatPosyandu extends StatefulWidget {
  @override
  State<RiwayatPosyandu> createState() => _RiwayatPosyanduState();
}

class _RiwayatPosyanduState extends State<RiwayatPosyandu> {
  List<PosyanduData> riwayatPosyandu = [
    PosyanduData(bb: 12, tb: 120, tanggal: DateTime.now()),
    PosyanduData(
        bb: 13, tb: 125, tanggal: DateTime.now().subtract(Duration(days: 7))),
    PosyanduData(
        bb: 14, tb: 130, tanggal: DateTime.now().subtract(Duration(days: 14))),
  ];

  @override
  Widget build(BuildContext context) {
    double lebarLayar = MediaQuery.of(context).size.width;
    double tinggiLayar = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: lebarLayar,
          height: tinggiLayar,
          padding: const EdgeInsets.only(top: 20),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 393,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 48,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          child: Stack(
                                            children: [
                                              Icon(
                                                Icons.arrow_back_ios,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Riwayat Data Posyandu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              Expanded(
                child: ListView.builder(
                  itemCount: riwayatPosyandu.length,
                  itemBuilder: (context, index) {
                    final data = riwayatPosyandu[index];
                    return Card(
                      elevation:
                          2, // tambahkan elevasi untuk memberi efek bayangan
                      margin: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20), // atur margin untuk setiap item
                      child: ListTile(
                        contentPadding: EdgeInsets.all(
                            10), // tambahkan padding untuk konten ListTile
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Berat Badan : ${data.bb} kg',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Tinggi Badan : ${data.tb} cm',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          'Tanggal Pengukuran : ${DateFormat('dd-MM-yyyy').format(data.tanggal)}',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
