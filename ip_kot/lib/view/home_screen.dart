import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ip_kot/controller/ip_controller.dart';
import 'package:ip_kot/model/ip_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final IPController controller =
        Get.find(); // Get the instance of IPController
    List<IPModel> myList = controller.ipList;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'IP Details',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            // Use ListView.builder to display a list of IP details
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: myList.length,
              itemBuilder: (context, index) {
                IPModel ip = myList[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Status: ${ip.status ?? ""}'),
                      Text('Country: ${ip.country ?? ""}'),
                      Text('City: ${ip.city ?? ""}'),
                      Text('ISP: ${ip.isp ?? ""}'),
                      Text('lat: ${ip.lat ?? ""}'),
                      Text('lon: ${ip.lon ?? ""}'),
                      Text('region: ${ip.region ?? ""}'),
                      Text('time zone: ${ip.timezone ?? ""}'),
                      Divider(color: Colors.grey),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
