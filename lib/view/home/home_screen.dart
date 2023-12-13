// ignore_for_file: sort_child_properties_last, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:machinetest/controller/dashboard_provider.dart';
import 'package:machinetest/model/hive_model.dart';
import 'package:machinetest/view/home/dashboard_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownvalue = 'Prod TEST';

  var items = [
    'Prod TEST',
  ];
  final DashboardProvider dashboardProvider = DashboardProvider();
  late List<Dashboard> dashboards = [];

  @override
  void initState() {
    super.initState();
    openHiveBox();
    loadDashboardItems();
  }

  Future<void> openHiveBox() async {
    await Hive.openBox<Dashboard>('dashboardBox');
  }

  Future<void> loadDashboardItems() async {
    try {
      dashboards = await dashboardProvider.fetchDashboardItems();
      var box = Hive.box<Dashboard>('dashboardBox');
      box.addAll(dashboards);
      List<Dashboard> fetchedDashboards =
          await dashboardProvider.fetchDashboardItems();
      setState(() {
        dashboards = fetchedDashboards;
      });
    } catch (error) {
      print('Error loading dashboard items: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var box = Hive.box<Dashboard>('dashboardBox');
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.person_2,
                          color: Colors.white,
                          size: 58,
                        ),
                        backgroundColor: Color.fromARGB(255, 199, 196, 196),
                        radius: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Username",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "teganpricecaplangold@gmail.com",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  )),
              DropdownButton(
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
              ListTile(
                leading:
                    const Icon(Icons.dashboard_outlined, color: Colors.orange),
                title: const Text('Dashboard'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DashboardPage(dashboards: dashboards),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.folder_copy_outlined,
                    color: Colors.orange),
                title: const Text('Documents'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.email_outlined, color: Colors.orange),
                title: const Text('Email'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.dashboard, color: Colors.orange),
                title: const Text('Directory'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.image_search_rounded,
                    color: Colors.orange),
                title: const Text('Site'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.help_outline_outlined,
                    color: Colors.orange),
                title: const Text('Help'),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text(
            "INAXUS",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
