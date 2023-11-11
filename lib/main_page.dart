import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gentext/main_controller.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  static const _title = "文字助手";

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,,
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
        title: const Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("data"),
            TextField(
              controller: controller.nameController,
            ),
            TextField(
              controller: controller.rawTextController,
            ),
            InkWell(
              child: const Text("生成"),
              onTap: () {
                controller.generate();
              },
            ),
            ListView.builder(
              itemCount: controller.generateList.length,
              itemExtent: 50.0, //强制高度为50.0
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text(controller.generateList[index]));
              },
            ),
          ],
        ),
      ),
    );
  }
}
