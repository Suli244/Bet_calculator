import 'package:hive_flutter/hive_flutter.dart';

part 'express_hive_model.g.dart';

@HiveType(typeId: 0)
class ExpressHiveModel extends HiveObject {
  @HiveField(0)
  String result;
  @HiveField(1)
  String stakeAmount;
  @HiveField(2)
  String number;
  @HiveField(3)
  List<String> coefficients;
  @HiveField(4)
  DateTime date;
  ExpressHiveModel({
    required this.result,
    required this.stakeAmount,
    required this.number,
    required this.coefficients,
    required this.date,
  });
}
