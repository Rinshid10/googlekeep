import 'package:flutter/material.dart';
import 'package:googlekeep/screens/modal/modal.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<GoogleNots>> googleNotifier = ValueNotifier([]);

Future addData(GoogleNots value) async {
  final googleSave = await Hive.openBox<GoogleNots>('save_data');
  googleSave.add(value);

  googleNotifier.value.add(value);

  // ignore: invalid_use_of_protected_member
  googleNotifier.notifyListeners();
}

Future getAllDAta() async {
  final googleSave = await Hive.openBox<GoogleNots>('save_data');
  googleNotifier.value.clear();
  googleNotifier.value.addAll(googleSave.values);
  // ignore: invalid_use_of_protected_member
  googleNotifier.notifyListeners();
}

Future deleteData(int index) async {
  final googleSave = await Hive.openBox<GoogleNots>('save_data');
  googleSave.deleteAt(index);
  getAllDAta();
}

Future<void> editing(index, GoogleNots value) async {
  final googleSave = await Hive.openBox<GoogleNots>('save_data');

  // ignore: invalid_use_of_protected_member
  googleNotifier.notifyListeners();
  googleSave.putAt(index, value);
  getAllDAta();
}
