import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:googlekeep/screens/functons/functions.dart';
import 'package:googlekeep/screens/modal/modal.dart';

// ignore: must_be_immutable
class Edit extends StatefulWidget {
  String? titles;
  String? subtitilss;
  int index;
  Edit(
      {required this.titles,
      required this.subtitilss,
      super.key,
      required this.index});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController tiTc = TextEditingController();
  TextEditingController subC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    tiTc = TextEditingController(text: widget.titles);
    subC = TextEditingController(text: widget.subtitilss);
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
                  controller: tiTc,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle:
                          TextStyle(fontSize: 25, color: Colors.black54)),
                ),
                TextField(
                  controller: subC,
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
                        updateAll();
                      },
                      icon: const Icon(Icons.check_circle)),
                  const Gap(15)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> updateAll() async {
    final t = tiTc.text;
    final s = subC.text;

    final update = GoogleNots(subTitle: s, title: t);
    editing(widget.index, update);
    Navigator.pop(context);
  }
}
