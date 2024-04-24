import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sempolita_kreanova_app/models/user.dart';
import 'package:sempolita_kreanova_app/services/myserverconfig.dart';
import 'package:sempolita_kreanova_app/views/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final TextEditingController _namaOrtuController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  FocusNode _namaOrtu = FocusNode();
  FocusNode _noHp = FocusNode();
  FocusNode _email = FocusNode();
  FocusNode _pass = FocusNode();
  FocusNode _confirmPass = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void _registerUser(BuildContext context) {
    String _namaOrtu = _namaOrtuController.text;
    String _noHp = _noHpController.text;
    String _email = _emailController.text;
    String _pass = _passController.text;
    String _confirmPass = _confirmPassController.text;

    var body = jsonEncode({
      "name": "$_namaOrtu",
      "phone_number": "$_noHp",
      "email": "$_email",
      "password": "$_pass"
    });

    http
        .post(Uri.parse("${MyServerConfig.server}/api/v1/auth/register"),
            headers: {"Content-Type": "application/json"}, body: body)
        .then((response) {
      print(response.statusCode);
      print(response.body);
      print(body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == "success") {
          User user = User.fromJson(data['data']);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Success"),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (content) => LoginPage(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Failed"),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else if (response.statusCode == 400) {
        var data = jsonDecode(response.body);
      }
    });
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
          height: 800,
          padding: const EdgeInsets.only(
            top: 80,
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
                  'Yuk, Pantau Terus \nKesehatan Buah Hati Kita !',
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
                height: 580,
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
                                  controller: _namaOrtuController,
                                  focusNode: _namaOrtu,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(
                                        context, _namaOrtu, _noHp);
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Masukan Nama Anda",
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
                                  'Nama Orang Tua',
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
                      top: 90,
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
                                  controller: _noHpController,
                                  focusNode: _noHp,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(context, _noHp, _email);
                                  },
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter
                                        .digitsOnly // Allow only digits
                                  ],
                                  decoration: InputDecoration(
                                    hintText: "Masukan Nomor Telepon Anda",
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
                      top: 180,
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
                                  controller: _emailController,
                                  focusNode: _email,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  validator: (val) => val!.isEmpty ||
                                          !val.contains("@") ||
                                          !val.contains(".")
                                      ? "Please enter a valid email"
                                      : null,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(context, _email, _pass);
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Masukan e-mail Anda",
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
                                  'E-mail',
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
                      top: 270,
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
                                  controller: _passController,
                                  focusNode: _pass,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(
                                        context, _pass, _confirmPass);
                                  },
                                  validator: (val) =>
                                      val!.isEmpty || (val.length < 3)
                                          ? "Please enter password"
                                          : null,
                                  obscureText:
                                      !_isPasswordVisible, // This hides the entered text as dots for a password field
                                  decoration: InputDecoration(
                                    hintText: "Masukan Password Anda",
                                    hintStyle: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.only(top: 0, left: 20),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFFDBD7EB)),
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey, // Warna ikon mata
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisible =
                                              !_isPasswordVisible;
                                        });
                                      },
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
                      top: 360,
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
                                  controller: _confirmPassController,
                                  focusNode: _confirmPass,
                                  obscureText:
                                      !_isConfirmPasswordVisible, // This hides the entered text as dots for a password field
                                  decoration: InputDecoration(
                                    hintText: "Ulangi Password Anda",
                                    hintStyle: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.only(top: 0, left: 20),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFFDBD7EB)),
                                      borderRadius: BorderRadius.circular(17),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isConfirmPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey, // Warna ikon mata
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isConfirmPasswordVisible =
                                              !_isConfirmPasswordVisible;
                                        });
                                      },
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
                                  'Ulangi Password',
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
                      top: 470,
                      child: Container(
                        width: 287,
                        height: 50.57,
                        child: ElevatedButton(
                          onPressed: () {
                            _registerUser(context);
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
                              'Ayo Mulai !',
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
                      left: 35,
                      top: 530,
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
                                  text: 'Sudah Memiliki Akun? ',
                                  style: TextStyle(
                                    color: Color(0xFF999999),
                                    fontSize: 12,
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Login Sekarang',
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
                      left: 63,
                      top: 560,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, '/termsConditions');
                        },
                        child: Text(
                          'Terms and Conditions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF31C48D),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.underline,
                            height: 0,
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
