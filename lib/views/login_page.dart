import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sempolita_kreanova_app/services/myserverconfig.dart';
import 'package:sempolita_kreanova_app/shared/loading.dart';
import 'package:sempolita_kreanova_app/views/dashboard/landing_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  FocusNode _key = FocusNode();
  FocusNode _pass = FocusNode();
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void _login(BuildContext context) {
    setState(() {
      _isLoading = true;
    });
    String _key = _keyController.text;
    String _pass = _passController.text;

    var body = jsonEncode({"key": "$_key", "password": "$_pass"});

    http
        .post(Uri.parse("${MyServerConfig.server}/api/v1/auth/login"),
            headers: {"Content-Type": "application/json"}, body: body)
        .then((response) async {
      print(response.body);
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', json.decode(response.body)['token']);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Success"),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (content) => LandingPage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Gagal. Akun atau kata sandi salah!"),
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
            padding: EdgeInsets.symmetric(
              vertical: tinggiLayar * 0.2,
              horizontal: lebarLayar * 0.1,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: lebarLayar * 0.8,
                  child: const Text(
                    'Masuk, Pantau \nBuah Hati Kita',
                    style: TextStyle(
                      color: Color(0xFF1E1349),
                      fontSize: 28,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: lebarLayar * 0.8,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nomor Telepon atau E-mail',
                              style: TextStyle(
                                color: Color(0xFF1E1349),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              focusNode: _key,
                              controller: _keyController,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (term) {
                                _fieldFocusChange(context, _key, _pass);
                              },
                              decoration: InputDecoration(
                                hintText: 'Masukan Nomor Telepon atau E-mail',
                                hintStyle: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFDBD7EB)),
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Password',
                              style: TextStyle(
                                color: Color(0xFF1E1349),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              focusNode: _pass,
                              controller: _passController,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                hintText: 'Masukan Password',
                                hintStyle: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFDBD7EB)),
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _isLoading
                          ? LoadingIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                _login(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF31C48D),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 40),
                                minimumSize:
                                    Size(lebarLayar * 0.8, tinggiLayar * 0.07),
                              ),
                              child: const Text(
                                'Masuk',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, '/forgetpass');
                        },
                        child: const Text(
                          'Lupa Password?',
                          style: TextStyle(
                            color: Color(0xFF818181),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
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
}
