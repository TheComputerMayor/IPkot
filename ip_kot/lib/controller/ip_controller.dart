import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ip_kot/model/ip_model.dart';
import 'package:http/http.dart' as http;
import 'package:ip_kot/view/home_screen.dart';

class IPController extends GetxController {
  var ipList = <IPModel>[].obs; // Change to observable list
  var isLoading = true.obs;
  final TextEditingController ip = TextEditingController();

  Future<void> fetchData(String ipAddress) async {
    isLoading(true);
    const String url = "http://ip-api.com/json/";
    try {
      final response = await http.get(Uri.parse("$url$ipAddress"));
      if (response.statusCode == 200) {
        final Map<String, dynamic> result = jsonDecode(response.body);

        // Check if the status is success
        if (result["status"] == "success") {
          // Assuming the result is a single IPModel instance
          final IPModel ipModel = IPModel.fromJson(result);
          ipList
              .add(ipModel); // Use add method to add single IPModel to the list
          goToDetails();
        } else {
          print("Error: IP not found");
        }
      } else {
        print(
            "Error: Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
    update();
  }

  void goToDetails() {
    Get.to(HomePage());
  }
}
