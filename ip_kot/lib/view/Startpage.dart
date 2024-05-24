import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ip_kot/controller/ip_controller.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);
  final controller = Get.put(IPController());
  final TextEditingController ipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Expanded(child: Container()),
          Expanded(
            child: Center(
              child: Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.all(8),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                child: TextFormField(
                  controller: ipController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              child: ElevatedButton(
                onPressed: () {
                  controller.fetchData(ipController.text);
                },
                child: Container(
                  color: Colors.black,
                  child: Text("Get Info"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
