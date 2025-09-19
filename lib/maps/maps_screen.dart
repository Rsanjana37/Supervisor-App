import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:supervisor/tasks/task_detail_screen.dart';
import 'package:supervisor/tasks/task_reports.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LeafletMapScreen extends StatefulWidget {
  final double lat;
  final double lng;

  const LeafletMapScreen({super.key, required this.lat, required this.lng});

  @override
  State<LeafletMapScreen> createState() => _LeafletMapScreenState();
}

class _LeafletMapScreenState extends State<LeafletMapScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted);
    _loadHtmlFromAssets();
  }

  Future<void> _loadHtmlFromAssets() async {
    String htmlString = await rootBundle.loadString('assets/map.html');

    // Inject the coordinates
    htmlString = htmlString.replaceFirst('// COORD_PLACEHOLDER', '''
      const issues = [{
        id: 1,
        title: "Selected Issue",
        status: "pending",
        locationName: "From Flutter",
        lat: ${widget.lat}, lng: ${widget.lng}
      }];
      ''');

    _controller.loadRequest(
      Uri.dataFromString(
        htmlString,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = screenHeight * 0.10;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskDashboard()),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
          automaticallyImplyLeading: false,
          elevation: 0.5,
          backgroundColor: const Color.fromARGB(157, 248, 255, 154),
          title: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Task Report Details",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "Municipal Services Portal",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                //SizedBox(height: 4),
              ],
            ),
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
          ),
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
