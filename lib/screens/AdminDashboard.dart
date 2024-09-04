import 'package:flutter/material.dart';
import 'package:kigali/helpers/DatabaseHelper.dart';
import 'package:kigali/models/Booking.dart';

class AdminDashboardScreen extends StatefulWidget {
  @override
  _AdminDashboardScreenState createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  late Future<List<Booking>> _bookingsFuture;

  @override
  void initState() {
    super.initState();
    _bookingsFuture = _dbHelper.getBookings();
    print('AdminDashboardScreen: initState');
    print('AdminDashboardScreen: _bookingsFuture: $_bookingsFuture');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Container(
        color: Colors.teal[50],
        child: FutureBuilder<List<Booking>>(
          future: _bookingsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Print the error to the console and show the error message in the UI
              print('Error: ${snapshot.error}');
              return Center(
                  child: Text('Error loading bookings: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No bookings found'));
            } else {
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final booking = snapshot.data![index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.event, color: Colors.teal),
                      title: Text(
                        booking.placeName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text('Date: ${booking.bookingDate}',
                              style: TextStyle(color: Colors.grey[700])),
                          Text('Price: ${booking.price}',
                              style: TextStyle(color: Colors.grey[700])),
                          Text('User: ${booking.userName}',
                              style: TextStyle(color: Colors.grey[700])),
                          Text('Phone: ${booking.phoneNumber}',
                              style: TextStyle(color: Colors.grey[700])),
                          Text('Comment: ${booking.comment}',
                              style: TextStyle(color: Colors.grey[700])),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert, color: Colors.teal),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
