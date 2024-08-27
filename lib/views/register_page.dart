import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sempolita_kreanova_app/services/myserverconfig.dart';
import 'package:sempolita_kreanova_app/shared/loading.dart';
import 'package:sempolita_kreanova_app/views/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  final TextEditingController _namaOrtuController = TextEditingController();
  final TextEditingController _namaBalitaController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;
  FocusNode _namaOrtu = FocusNode();
  FocusNode _namaBalita = FocusNode();
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
    setState(() {
      _isLoading = true; // Set loading menjadi true saat fungsi dimulai
    });

    String _namaOrtu = _namaOrtuController.text;
    String _namaBalita = _namaBalitaController.text;
    String _noHp = _noHpController.text;
    String _email = _emailController.text;
    String _pass = _passController.text;
    String _confirmPass = _confirmPassController.text;

    var body = jsonEncode({
      "name": "$_namaOrtu",
      "child_name": "$_namaBalita",
      "phone_number": "$_noHp",
      "email": "$_email",
      "password": "$_pass"
    });

    http
        .post(Uri.parse("${MyServerConfig.server}/api/v1/auth/register"),
            headers: {"Content-Type": "application/json"}, body: body)
        .then((response) {
      print(response.body);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Register Success"),
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
            content: Text("Pembuatan Akun Gagal. Mohon koreksi kembali"),
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
    double tinggiLayar = 900;
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Container(
            width: lebarLayar,
            height: tinggiLayar,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yuk, Pantau Terus \nKesehatan Buah Hati Kita !',
                  style: TextStyle(
                    color: Color(0xFF1E1349),
                    fontSize: lebarLayar * 0.07,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: lebarLayar * 0.9,
                  child: Column(
                    children: [
                      _buildTextFormField(
                        "Nama Orang Tua",
                        "Masukan Nama Anda",
                        _namaOrtuController,
                        _namaOrtu,
                        _namaBalita,
                      ),
                      SizedBox(height: 20),
                      _buildTextFormField(
                        "Nama Anak",
                        "Masukan Nama Anak Anda",
                        _namaBalitaController,
                        _namaBalita,
                        _noHp,
                      ),
                      SizedBox(height: 20),
                      _buildTextFormField(
                        "Nomor Telepon",
                        "Masukan Nomor Telepon Anda",
                        _noHpController,
                        _noHp,
                        _email,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                      SizedBox(height: 20),
                      _buildTextFormField(
                        "E-mail",
                        "Masukan e-mail Anda",
                        _emailController,
                        _email,
                        _pass,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) => val!.isEmpty ||
                                !val.contains("@") ||
                                !val.contains(".")
                            ? "Please enter a valid email"
                            : null,
                      ),
                      SizedBox(height: 20),
                      _buildPasswordFormField(
                        "Password",
                        "Masukan Password Anda",
                        _passController,
                        _pass,
                        _confirmPass,
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: lebarLayar * 0.8,
                        height: tinggiLayar * 0.07,
                        child: _isLoading
                            ? LoadingIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  _registerUser(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF31C48D),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                                child: Text(
                                  'Ayo Mulai !',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: lebarLayar * 0.045,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
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
                                  fontSize: lebarLayar * 0.03,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'Login Sekarang',
                                style: TextStyle(
                                  color: Color(0xFF31C48D),
                                  fontSize: lebarLayar * 0.03,
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, '/termsConditions');
                        },
                        child: Text(
                          'Terms and Conditions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF31C48D),
                            fontSize: lebarLayar * 0.035,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.underline,
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
      ),
    );
  }

  Widget _buildTextFormField(
    String label,
    String hint,
    TextEditingController controller,
    FocusNode currentFocus,
    FocusNode nextFocus, {
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF1E1349),
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          focusNode: currentFocus,
          textInputAction: TextInputAction.next,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator,
          onFieldSubmitted: (term) {
            _fieldFocusChange(context, currentFocus, nextFocus);
          },
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF31C48D),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF1E1349),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordFormField(
    String label,
    String hint,
    TextEditingController controller,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF1E1349),
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          focusNode: currentFocus,
          textInputAction: TextInputAction.done,
          obscureText: !_isPasswordVisible,
          onFieldSubmitted: (term) {
            _fieldFocusChange(context, currentFocus, nextFocus);
          },
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF31C48D),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF1E1349),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
