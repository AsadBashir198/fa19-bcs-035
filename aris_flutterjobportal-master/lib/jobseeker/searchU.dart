import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<DocumentSnapshot> searchResults = [];

  Future<void> searchFirestoreData(Map<String, dynamic> filters) async {
    // Create a Firestore query based on the provided filters
    Query query = FirebaseFirestore.instance.collection('jobpost');

    // Apply the filters to the query
    filters.forEach((field, value) {
      query = query.where(field, isEqualTo: value);
    });

    // Retrieve the filtered documents
    QuerySnapshot querySnapshot = await query.get();

    setState(() {
      // Store the retrieved documents in searchResults
      searchResults = querySnapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Search'),
      ),
      body: Column(
        children: [
          // Add filter input fields here
          TextField(
            decoration: InputDecoration(
              labelText: 'Job Title',
            ),
            onChanged: (value) {
              // Update the job title filter
              // ...
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Designation',
            ),
            onChanged: (value) {
              // Update the designation filter
              // ...
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Company',
            ),
            onChanged: (value) {
              // Update the company filter
              // ...
            },
          ),
          RaisedButton(
            child: Text('Search'),
            onPressed: () {
              // Define your filters as a map
              Map<String, dynamic> filters = {
                'jobtitle': 'fadii', // Replace 'value1' with the actual filter value for job title
                'designation': 'gujbvcrhk', // Replace 'value2' with the actual filter value for designation
                'company': 'asadgh', // Replace 'value3' with the actual filter value for company
              };

              searchFirestoreData(filters);
            },
          ),

          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doc = searchResults[index];
                // Display the document details
                return ListTile(
                  title: Text(doc['jobtitle']),
                  subtitle: Text(doc['designation']),
                  // Add more fields to display as needed
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
