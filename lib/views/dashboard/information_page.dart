import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  WebViewController? _controller;
  bool _isLoading = true;
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              _progressValue = progress / 100;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://ayosehat.kemkes.go.id/kategori-usia/bayi-dan-balita'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(top: 50, bottom: 10),
          child: Text('Informasi Kesehatan Balita'),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: WebViewWidget(
              controller: _controller!,
            ),
          ),
          if (_isLoading)
            Positioned(
              top: 5,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(
                value: _progressValue,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF31C48D)),
              ),
            ),
        ],
      ),
    );
  }
}
