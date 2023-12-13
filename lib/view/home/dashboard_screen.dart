import 'package:flutter/material.dart';
import 'package:machinetest/model/hive_model.dart';

class DashboardPage extends StatelessWidget {
  final List<Dashboard> dashboards;

  const DashboardPage({Key? key, required this.dashboards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: ListView.builder(
        itemCount: dashboards.length,
        itemBuilder: (context, index) {
          final dashboard = dashboards[index];
          return ListTile(
            leading: Text(dashboard.moduleId.toString()),
            title: Text(dashboard.moduleName.toString()),
          );
        },
      ),
    );
  }
}
