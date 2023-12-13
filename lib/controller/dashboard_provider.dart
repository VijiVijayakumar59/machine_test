import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:machinetest/model/dashboard_box.dart';
import 'package:machinetest/model/hive_model.dart';

class DashboardProvider with ChangeNotifier {
  List<DashboardHive> dashboardss = [];
  fetchDashboardItems() async {
    const url =
        'https://mobile.inaxus.com/api/Common/ContentCache?Email=teganpricecaplangold@gmail.com&Password=Paperless@2021&DatabaseName=InaxusV5&ProjectID=2';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data.containsKey('ModuleList')) {
          final List<dynamic> moduleLists = data['ModuleList'];
          final List<DashboardHive> dashboardList = moduleLists.map((module) {
            return DashboardHive(
              moduleId: module['ModuleId'],
              moduleName: module['ModuleName'],
            );
          }).toList();
          dashboardss = dashboardList;
          final box = DashboardBox.getInstance();
          box.clear();
          box.addAll(dashboardList);
          log(box.values.toString());
          notifyListeners();
        } else {
          throw Exception('ModuleLists not found in API response');
        }
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error during API request: $error');
    }
  }
}
