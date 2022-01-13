import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:todo_app/utilities.dart";

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedItem = "todo";

  final List<Map<String, dynamic>> _uncompletedData = [];

  final List<Map<String, dynamic>> _completedData = [];

  final List<Map<String, dynamic>> data = [
    {
      "title": "Visit",
      "description": "Go to Ohemaa Abena's house.",
      "date_time": "Yesterday",
      "status": true
    },
    {
      "title": "Poetry",
      "description": "Finish up with the poem.",
      "date_time": "Today",
      "status": true
    },
    {
      "title": "Shopping",
      "description": "Buy some groceries at the market.",
      "date_time": "Tomorrow",
      "status": false
    },
    {
      "title": "Mom",
      "description": "Call Mom to find out how she is doing.",
      "date_time": "Today",
      "status": false
    },
    {
      "title": "Birthday",
      "description": "Complete all assignments and submit.",
      "date_time": "Nov. 28",
      "status": false
    },
  ];

  @override
  void initState() {
    for (Map<String, dynamic> element in data) {
      if (!element["status"]) {
        _uncompletedData.add(element);
      } else {
        _completedData.add(element);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          leading: const Icon(Icons.task_sharp,
              color: Color.fromRGBO(37, 43, 103, 1), size: 40),
          title: const Text("My Tasks",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(37, 43, 103, 1))),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_outlined,
                  color: Color.fromRGBO(37, 43, 103, 1),
                )),
            PopupMenuButton<String>(
              icon:
                  const Icon(Icons.menu, color: Color.fromRGBO(37, 43, 103, 1)),
              onSelected: (value) {
                setState(() {
                  selectedItem = value;
                });
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(child: Text("Todo"), value: "todo"),
                  const PopupMenuItem(
                      child: Text("Completed"), value: "completed")
                ];
              },
            )
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(37, 43, 103, 1),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, index) {
            return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(children: [
                    Icon(Icons.check_circle_outline_outlined,
                        color: customColor(
                            date: _uncompletedData[index]["date_time"])),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(_uncompletedData[index]["title"],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(37, 43, 103, 1))),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(_uncompletedData[index]["description"],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey)),
                        ),
                      ]),
                    ),
                    const SizedBox(width: 15),
                    Row(children: [
                      Icon(Icons.notifications_outlined,
                          color: customColor(
                              date: _uncompletedData[index]["date_time"])),
                      Text(_uncompletedData[index]["date_time"],
                          style: TextStyle(
                              color: customColor(
                                  date: _uncompletedData[index]["date_time"])))
                    ])
                  ]),
                ));
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 5);
          },
          itemCount: selectedItem == "todo"
              ? _uncompletedData.length
              : _completedData.length),
    );
  }
}
