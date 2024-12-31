import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> itemList = [
    'Aaradhna',
    'Riya',
    'Harsha',
    'Anil',
    'Gautam',
    'Aayush',
    'Rahul',
    'Aakash',
    'Anjali',
    'Chinu',
    'Shreya',
    'Ajay',
    'Mohit',
    'Gaurav',
  ];
  List<String> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = itemList; // Initially show all items
  }

  void filterList(String query) {
    setState(() {
      filteredList = itemList
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Search Bar'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white, // Ensure a clear background
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Search bar
            TextField(
              onChanged: (value) {
                filterList(value);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
            ),
            const SizedBox(height: 10),
            // Display the filtered list
            Expanded(
              child: filteredList.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredList[index]),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'No items match your search.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}