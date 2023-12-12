import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class Dashboard extends HiveObject {
  @HiveField(0)
  final int? moduleId;
  @HiveField(1)
  final String? moduleName;
  Dashboard({
    this.moduleId,
    this.moduleName,
  });
}
