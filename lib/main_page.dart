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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
        title: const Text(_title),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
            ),
            TextField(
              controller: controller.rawTextController,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  child: const Text("生成"),
                  onPressed: () {
                    controller.generate();
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  child: const Text("一键复制"),
                  onPressed: () {
                    controller.copyAll();
                  },
                ),
              ],
            ),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: controller.generateList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(children: [
                      IconButton(
                          onPressed: () async {
                            controller.copy(index);
                          },
                          icon: const Icon(Icons.copy)),
                      Text(controller.generateList[index]),
                    ]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
