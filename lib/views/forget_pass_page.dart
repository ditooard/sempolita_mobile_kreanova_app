import 'package:flutter/material.dart';

class LupaPassword extends StatefulWidget {
  @override
  State<LupaPassword> createState() => _LupaPassword();
}

class _LupaPassword extends State<LupaPassword> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double lebarLayar = MediaQuery.of(context).size.width;
    double tinggiLayar = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: lebarLayar,
          height: tinggiLayar,
          padding: const EdgeInsets.only(
            top: 80,
            left: 41,
            right: 41,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 311,
                height: 546.57,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 353,
                      child: Container(
                        width: 287,
                        height: 75.39,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 24.82,
                              child: Container(
                                width: 287,
                                height: 52,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Masukan Nomor Telepon',
                                    hintStyle: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.only(top: 0, left: 20),
                                    // Sesuaikan angka ini sesuai kebutuhan Anda
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFFDBD7EB)),
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: SizedBox(
                                width: 268,
                                height: 19.31,
                                child: Text(
                                  'Nomor Telepon',
                                  style: TextStyle(
                                    color: Color(0xFF1E1349),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 454,
                      child: SizedBox(
                        width: 311,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Ingat password? ',
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: 12,
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Kembali Masuk',
                                  style: TextStyle(
                                    color: Color(0xFF31C48D),
                                    fontSize: 12,
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 496,
                      child: Container(
                        width: 287,
                        height: 50.57,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle button press
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF31C48D), // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 12.87),
                            child: Text(
                              'Kirim',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 286,
                      child: SizedBox(
                        width: 311,
                        child: Text(
                          'Kode Verifikasi untuk mengatur ulang password akan dikirim melalui SMS.',
                          style: TextStyle(
                            color: Color(0xFF4D4D4D),
                            fontSize: 13,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 36,
                      top: 0,
                      child: Container(
                        width: 239,
                        height: 265.44,
                        child: Image.asset('assets/images/lupa_pw.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
