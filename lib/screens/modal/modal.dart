import 'package:hive/hive.dart';
part 'modal.g.dart';

@HiveType(typeId: 0)
class GoogleNots {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? subTitle;
  GoogleNots({required this.title, required this.subTitle});
}
