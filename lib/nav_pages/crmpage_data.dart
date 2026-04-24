import 'package:flutter/material.dart';

class CrmpageData extends StatefulWidget {
  const CrmpageData({super.key});

  @override
  State<CrmpageData> createState() => _CrmpageDataState();
}

class _CrmpageDataState extends State<CrmpageData> {

  final List<Map<String, dynamic>> customerData = [
    {
      "id": 1,
      "roomNumber": "101",
      "type": "Single",
      "price": 1200,
      "status": "Available",
      "floor": "1st Floor",
      "color": Colors.green,
      "guestName": "N/A",
      "lastCall": "No recording"
    },
    {
      "id": 2,
      "roomNumber": "102",
      "type": "Double",
      "price": 2000,
      "status": "Occupied",
      "floor": "1st Floor",
      "color": Colors.red,
      "guestName": "Amit Sharma",
      "lastCall": "02:15 min"
    },
    {
      "id": 3,
      "roomNumber": "103",
      "type": "Deluxe",
      "price": 3500,
      "status": "Cleaning",
      "floor": "1st Floor",
      "color": Colors.orange,
      "guestName": "Rahul Verma",
      "lastCall": "01:30 min"
    },
    {
      "id": 4,
      "roomNumber": "201",
      "type": "Suite",
      "price": 5500,
      "status": "Available",
      "floor": "2nd Floor",
      "color": Colors.green,
      "guestName": "N/A",
      "lastCall": "No recording"
    },
    {
      "id": 5,
      "roomNumber": "202",
      "type": "Single",
      "price": 1200,
      "status": "Maintenance",
      "floor": "2nd Floor",
      "color": Colors.grey,
      "guestName": "Staff",
      "lastCall": "Internally Checked"
    },
    {
      "id": 6,
      "roomNumber": "203",
      "type": "Double",
      "price": 2000,
      "status": "Occupied",
      "floor": "2nd Floor",
      "color": Colors.red,
      "guestName": "Priya Singh",
      "lastCall": "03:45 min"
    },
    {
      "id": 7,
      "roomNumber": "301",
      "type": "Deluxe",
      "price": 3500,
      "status": "Available",
      "floor": "3rd Floor",
      "color": Colors.green,
      "guestName": "N/A",
      "lastCall": "No recording"
    },
    {
      "id": 8,
      "roomNumber": "302",
      "type": "Suite",
      "price": 6000,
      "status": "Reserved",
      "floor": "3rd Floor",
      "color": Colors.blue,
      "guestName": "Suresh Gupta",
      "lastCall": "05:10 min"
    },
    {
      "id": 9,
      "roomNumber": "303",
      "type": "Single",
      "price": 1300,
      "status": "Cleaning",
      "floor": "3rd Floor",
      "color": Colors.orange,
      "guestName": "Vikram Rathore",
      "lastCall": "01:10 min"
    },
    {
      "id": 10,
      "roomNumber": "401",
      "type": "Penthouse",
      "price": 12000,
      "status": "Available",
      "floor": "4th Floor",
      "color": Colors.green,
      "guestName": "N/A",
      "lastCall": "No recording"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: customerData.length,
          itemBuilder: (context, index){
          return Card(
              child: ListTile(
            leading: CircleAvatar(child: Text(customerData[index]["roomNumber"])),
            title: Text(customerData[index]["guestName"]?? "Default"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text(customerData[index]["type"]),
                Text(customerData[index]["type"]),
                Row(
                  children: [
                    //SizedBox(height: 11,),
                    Text("₹ ${customerData[index]["price"].toString()}"),
                    SizedBox(height: 25,),
                    Text(", ${customerData[index]["floor"]}"),
                  ],
                ),


              ],
            ),
                trailing: Column(
                  children: [
                    Text("Recording: ${customerData[index]["lastCall"]}"),
                    IconButton(onPressed: (){
                      // Recording play karne ka logic
                      SnackBar(content: Text("Playing recording of ${customerData[index]["guestName"]}..."));
                    }, icon: Icon(Icons.play_circle_fill, size: 15,))
                  ],
                ),

          ));
          }),
    );
  }
}

