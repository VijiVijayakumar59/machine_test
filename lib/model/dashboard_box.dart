import 'package:hive/hive.dart';
import 'package:machinetest/model/hive_model.dart';

class DashboardBox {
  static Box<DashboardHive>? box;
  static Box<DashboardHive> getInstance() {
    return box ?? Hive.box<DashboardHive>("dashboardss");
  }
}
