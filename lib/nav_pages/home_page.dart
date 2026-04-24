import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  final List<Map<String, dynamic>> roomsData = [
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
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
          ),
          itemCount: roomsData.length,
          itemBuilder: (context, index){
            return Container(
              decoration: BoxDecoration(
                color: roomsData[index]["color"],
                borderRadius: BorderRadius.circular(11)
              ),
              child: Column(
                children: [
                  Text(roomsData[index]["roomNumber"]),
                  SizedBox(height: 11,),
                  Text(roomsData[index]["type"]),
                  SizedBox(height: 11,),
                  Text(roomsData[index]["price"].toString()),
                  SizedBox(height: 11,),
                  Text(roomsData[index]["status"]),
                  SizedBox(height: 11,),
                  Text(roomsData[index]["floor"]),
                  SizedBox(height: 11,),
                  ElevatedButton(onPressed: (){
                    if(roomsData[index]["status"] == "Available"){
                      var nameController = TextEditingController();

                      showModalBottomSheet(
                          context: context,
                          //isScrollControlled: true,
                          builder: (context){

                            return Container(
                              padding: EdgeInsets.all(11),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  /// book process start
                                  Text("Book Room"),
                                  SizedBox(height: 5,),
                                  Text("Room Number: ${roomsData[index]["roomNumber"]}"),
                                  SizedBox(height: 11,),
                                  TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      hintText: "Enter Guest Name",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(11),
                                      )
                                    ),
                                  ),
                                  SizedBox(height: 25,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(onPressed: (){
                                        roomsData[index]["status"] = "Occupied";
                                        roomsData[index]["color"] = Colors.red;
                                        setState(() {});
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("Room booked successfully!", ), backgroundColor: Colors.green,),
                                        );
                                      }, child: Text("Confirm Booking"),),
                                      SizedBox(width: 11,),
                                      ElevatedButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, child: Text("Cancel")),

                                    ],
                                  )

                                ],
                              ),
                            );
                          });
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Room is not available.", ), backgroundColor: Colors.red,),
                      );
                    }
                  }, child: Text("Book"))
                ],
              ),
            );

          })
    );
  }
}
