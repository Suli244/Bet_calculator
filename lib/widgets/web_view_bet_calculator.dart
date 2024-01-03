import 'package:bet_calculator/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebFFBetCalculator extends StatefulWidget {
  final String url;
  final String title;

  const WebFFBetCalculator({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  State<WebFFBetCalculator> createState() => _WebFFBetCalculatorState();
}

class _WebFFBetCalculatorState extends State<WebFFBetCalculator> {
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBetCalculator(title: widget.title),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
