class Booking {
  final String placeName;
  final String bookingDate;
  final String price;
  final String userName;
  final String phoneNumber;
  final String comment;

  Booking({
    required this.placeName,
    required this.bookingDate,
    required this.price,
    required this.userName,
    required this.phoneNumber,
    required this.comment,
  });

  // Convert a Map into a Booking
  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      placeName: map['placeName'] ?? '',
      bookingDate: map['bookingDate'] ?? '',
      price: map['price'] ?? '',
      userName: map['userName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      comment: map['comment'] ?? '',
    );
  }

  // Convert a Booking into a Map
  Map<String, dynamic> toMap() {
    return {
      'placeName': placeName,
      'bookingDate': bookingDate,
      'price': price,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'comment': comment,
    };
  }
}
