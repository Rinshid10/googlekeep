// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:googlekeep/screens/add.dart';
import 'package:googlekeep/screens/edit.dart';
import 'package:googlekeep/screens/functons/functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  String searchTerm = '';

  @override
  void initState() {
    super.initState();
    getAllDAta();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(60),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Google Keep'),
              ),
              const Gap(10),
              listMethodss(name: 'Notes', iconsname: Icons.lightbulb),
              listMethodss(name: 'Create new label', iconsname: Icons.add),
              listMethodss(name: 'Archive', iconsname: Icons.archive),
              listMethodss(name: 'Trash', iconsname: Icons.delete),
              listMethodss(name: 'Settings', iconsname: Icons.settings),
              listMethodss(name: 'Help', iconsname: Icons.help),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffeaeef7),
        elevation: 10,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => addScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          searchTerm = value.toLowerCase();
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffeaeef7),
                        hintText: 'Search your notes..',
                        contentPadding: const EdgeInsets.all(5),
                        prefixIcon: const Icon(Icons.menu),
                        suffixIcon: const Icon(Icons.account_circle),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: googleNotifier,
                    builder: (context, google, child) {
                      // Filter notes based on search term
                      var filteredNotes = google.where((note) {
                        return note.title
                                .toString()
                                .toLowerCase()
                                .contains(searchTerm) ||
                            note.subTitle
                                .toString()
                                .toLowerCase()
                                .contains(searchTerm);
                      }).toList();

                      return SizedBox(
                        height: 500,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 4,
                                  childAspectRatio: 1.1),
                          itemBuilder: (context, index) {
                            var a = filteredNotes[index];
                            return GestureDetector(
                              onLongPress: () {
                                deleteData(index);
                              },
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => Edit(
                                      index: google.indexOf(a),
                                      subtitilss: a.subTitle,
                                      titles: a.title,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      a.title.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      a.subTitle.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 5,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: filteredNotes.length,
                        ),
                      );
                    },
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
                child: const Row(
                  children: [
                    Gap(15),
                    Icon(Icons.check_box),
                    Gap(15),
                    Icon(Icons.brush),
                    Gap(15),
                    Icon(Icons.mic),
                    Gap(15),
                    Icon(Icons.photo),
                    Gap(15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile listMethodss({required String name, required IconData iconsname}) {
    return ListTile(
      horizontalTitleGap: 10,
      onTap: () {},
      title: Text(name),
      leading: Icon(iconsname),
    );
  }
}
