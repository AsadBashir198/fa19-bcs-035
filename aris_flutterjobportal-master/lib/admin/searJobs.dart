import 'package:flutter/material.dart';
import 'package:flutter_job_portal/jobseeker/alljob.dart';

import 'home_page.dart';

void main() {
  runApp(const searAd());
}

class searAd extends StatelessWidget {
  const searAd({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Cu Jobs',
      home: searchjob(),
    );
  }
}

class searchjob extends StatefulWidget {
  const searchjob({Key key}) : super(key: key);

  @override
  _searchjobState createState() => _searchjobState();
}

class _searchjobState extends State<searchjob> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Lecturer", "age": 40},
    {"id": 2, "name": "Clerk", "age": 29},
    {"id": 3, "name": "Mali", "age": 5},
    {"id": 4, "name": "Lab Assistant", "age": 35},
    {"id": 5, "name": "Superintendents", "age": 21},
    {"id": 6, "name": "Sports Coach.", "age": 55},
    {"id": 7, "name": "Instructional Coordinators", "age": 30},
    {"id": 8, "name": "Library Technicians", "age": 14},

  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundJobs = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundJobs = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundJobs = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CU Jobs'),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  alljobs()),
              );
            }
        ),
        backgroundColor: Color(0xFF031047),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundJobs.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundJobs.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundJobs[index]["id"]),
                  color: Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Text(
                      _foundJobs[index]["id"].toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text(_foundJobs[index]['name']),
                    subtitle: Text(
                        '${_foundJobs[index]["age"].toString()} days before'),
                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}