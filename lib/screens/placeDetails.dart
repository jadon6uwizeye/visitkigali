import 'package:flutter/material.dart';
import 'package:kigali/helpers/DatabaseHelper.dart';
import 'package:kigali/models/Booking.dart';

class PlaceDetailsScreen extends StatefulWidget {
  final String placeName;
  final String category;
  final double rating;
  final int reviewCount;
  final String shortDescription;
  final String price;
  final String imageUrl;
  final String detailedDescription;

  const PlaceDetailsScreen({
    Key? key,
    required this.placeName,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.shortDescription,
    required this.price,
    required this.imageUrl,
    required this.detailedDescription,
  }) : super(key: key);

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  void _showBookingDialog() {
    final _nameController = TextEditingController();
    final _phoneController = TextEditingController();
    final _commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Details'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Your Name'),
                ),
                // SizedBox(height: 8),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 8),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    _selectedDate == null
                        ? 'Select Date'
                        : 'Booking Date: ${_selectedDate!.toIso8601String()}',
                  ),
                ),
                // SizedBox(height: 8),
                TextField(
                  controller: _commentController,
                  decoration: InputDecoration(labelText: 'Comment'),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  if (_selectedDate == null ||
                      _nameController.text.isEmpty ||
                      _phoneController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Please fill in all the details and select a date')),
                    );
                    return;
                  }

                  final formattedDate = _selectedDate!.toIso8601String();
                  final booking = Booking(
                    placeName: widget.placeName,
                    bookingDate: formattedDate,
                    price: widget.price,
                    userName: _nameController.text,
                    phoneNumber: _phoneController.text,
                    comment: _commentController.text,
                  );

                  await _dbHelper.insertBooking(booking);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Booking confirmed for $formattedDate')),
                  );

                  Navigator.of(context).pop();
                } catch (e) {
                  print(e);
                }
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.placeName,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: () {
              // Implement bookmark functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Carousel
              Container(
                height: 250,
                child: PageView(
                  children: [
                    // Image.network(widget.imageUrl, fit: B
                    Image.asset(widget.imageUrl, fit: BoxFit.cover),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                widget.placeName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.category,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text(
                    widget.rating.toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                widget.shortDescription,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              // add detailed description
              Text(
                widget.detailedDescription,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.wifi),
                      Text('Free Wi-Fi'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.local_parking),
                      Text('Parking'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.accessibility),
                      Text('Accessibility'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Booking Price',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(widget.price),
              // SizedBox(height: 16),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: _showBookingDialog,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Color.fromARGB(255, 81, 100, 209),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text('Book Now',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              SizedBox(height: 16),
              Text(
                'Reviews',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ListTile(
                leading: CircleAvatar(child: Text('A')),
                title: Text('User A'),
                subtitle: Text('This is a great place!'),
                trailing: Icon(Icons.star, color: Colors.amber),
              ),
              ListTile(
                leading: CircleAvatar(child: Text('B')),
                title: Text('User B'),
                subtitle: Text('Had a wonderful time here.'),
                trailing: Icon(Icons.star, color: Colors.amber),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
