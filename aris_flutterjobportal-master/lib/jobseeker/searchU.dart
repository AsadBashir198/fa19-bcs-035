import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'applyform.dart';

class SearchU extends StatefulWidget {
  @override
  _SearchUState createState() => _SearchUState();
}

class _SearchUState extends State<SearchU> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";
  List<QueryDocumentSnapshot> searchResults = [];

  Future<void> searchJob() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('jobpost')
        .where('jobtitle', isGreaterThanOrEqualTo: searchQuery)
        .where('jobtitle', isLessThan: searchQuery + 'z')
        .get();
    setState(() {
      searchResults = snapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Search',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: searchJob,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index]['jobtitle']),
                  subtitle: Text(searchResults[index]['company']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(searchResults[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final QueryDocumentSnapshot job;

  DetailsScreen(this.job);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Row(
              children: [
                Expanded(
                  child: Text(
                    'Job_Title:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    job['jobtitle'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Company:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    job['company'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Vacancies:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    job['vacancies'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Contact:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    job['contact'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Qualification:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    job['qualification'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Address:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    job['address'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Description:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    job['description'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Designation:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    job['designation'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Interview_Date:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    job['interviewdate'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Last_Date:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    job['l_date'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Max Salary:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    job['max salary'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Min Salary:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    job['min salary'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Start_Date:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    job['s_date'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Test_Date:',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Text(
                    job['test_date'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => apply()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF4BA5A5), // Set the background color
              ),

              child: Text('Apply'),
            ),

          ],
        ),
      ),
    );
  }
}
