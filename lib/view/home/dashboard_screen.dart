import 'package:flutter/material.dart';
import 'package:machinetest/controller/dashboard_provider.dart';
import 'package:machinetest/model/dashboard_box.dart';
import 'package:machinetest/model/hive_model.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Consumer<DashboardProvider>(builder: (context, provider, _) {
        if (provider.dashboardss.isEmpty) {
          provider.fetchDashboardItems();
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final database = DashboardBox.getInstance();
          List<DashboardHive> list = database.values.toList();
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final dashboard = list[index];
              return ListTile(
                leading: Text(dashboard.moduleId.toString()),
                title: Text(dashboard.moduleName.toString()),
              );
            },
          );
        }
      }),
    );
  }
}
