import 'package:hive_flutter/hive_flutter.dart';

part 'system_hive_model.g.dart';

@HiveType(typeId: 1)
class SystemHiveModel extends HiveObject {
  @HiveField(0)
  String result;
  @HiveField(1)
  String stakeAmount;
  @HiveField(2)
  String from;
  @HiveField(3)
  String systemType;
  @HiveField(4)
  List<String> coefficients;
  @HiveField(5)
  DateTime date;
  SystemHiveModel({
    required this.result,
    required this.stakeAmount,
    required this.from,
    required this.systemType,
    required this.coefficients,
    required this.date,
  });
}
