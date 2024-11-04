import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:googlekeep/screens/functons/functions.dart';
import 'package:googlekeep/screens/homeScreen.dart';
import 'package:googlekeep/screens/modal/modal.dart';

// ignore: camel_case_types
class addScreen extends StatefulWidget {
  const addScreen({super.key});

  @override
  State<addScreen> createState() => _addScreenState();
}

// ignore: camel_case_types
class _addScreenState extends State<addScreen> {
  final googleTitile = TextEditingController();

  final googleSubTtile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Icon(Icons.edit_location_alt),
                Gap(10),
                Icon(Icons.notification_add),
                Gap(10),
                Icon(Icons.archive),
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const Gap(20),
                TextField(
                  controller: googleTitile,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle:
                          TextStyle(fontSize: 25, color: Colors.black54)),
                ),
                TextField(
                  controller: googleSubTtile,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Note',
                      hintStyle:
                          TextStyle(fontSize: 15, color: Colors.black45)),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              width: double.infinity,
              color: const Color(0xffeaeef7),
              child: Row(
                children: [
                  const Gap(15),
                  const Icon(Icons.add_box),
                  const Gap(15),
                  const Icon(Icons.palette),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      addDatas(context);
                    },
                    icon: const Icon(Icons.check_circle),
                  ),
                  const Gap(15)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future addDatas(BuildContext context) async {
    final tit = googleTitile.text;
    final sub = googleSubTtile.text;

    final saveAll = GoogleNots(subTitle: sub, title: tit);
    addData(saveAll);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => const HomeScreen()));
  }
}
