import 'package:hive/hive.dart';
part 'web.g.dart';

@HiveType(typeId: 1)
class Web{

  @HiveField(0)
  final String title;

  @HiveField(1)
  final String subtitle;

  Web({required this.title, required this.subtitle});
}