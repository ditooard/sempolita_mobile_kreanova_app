import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
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
            top: 150,
            left: 46,
            right: 40,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 307,
                height: 87,
                child: Text(
                  'Masuk, Pantau \nBuah Hati Kita',
                  style: TextStyle(
                    color: Color(0xFF1E1349),
                    fontSize: 28,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Container(
                width: 292,
                height: 400,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
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
                      left: 3,
                      top: 93.78,
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
                                  obscureText:
                                      true, // This hides the entered text as dots for a password field
                                  decoration: InputDecoration(
                                    hintText: 'Masukan Password',
                                    hintStyle: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.only(top: 0, left: 20),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFFDBD7EB)),
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        // Implement the logic to toggle password visibility
                                      },
                                      child: Icon(
                                        Icons
                                            .visibility_off, // Use Icons.visibility if you want an open eye initially
                                        color: Colors
                                            .grey, // You can change the color as needed
                                      ),
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
                                  'Password',
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
                      top: 232,
                      child: Container(
                        width: 287,
                        height: 50.57,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/');
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
                              'Masuk',
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
                      left: 175,
                      top: 183,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, '/forgetpass');
                        },
                        child: SizedBox(
                          width: 117,
                          height: 19,
                          child: Text(
                            'Lupa Password?',
                            style: TextStyle(
                              color: Color(0xFF818181),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
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
