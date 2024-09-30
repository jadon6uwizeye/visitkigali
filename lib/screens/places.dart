import 'package:flutter/material.dart';
import 'package:kigali/screens/AdminLOgin.dart';
import 'package:kigali/screens/placeDetails.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const places = <Map<String, dynamic>>[
      {
        'name': 'Kigali Convention Centre',
        'category': 'Conference Center',
        'rating': 4.5,
        'reviewCount': 120,
        'shortDescription':
            'The Kigali Convention Centre is a state-of-the-art conference center located in the heart of Kigali.',
        'detailedDescription':
            'The Kigali Convention Centre is a state-of-the-art conference center located in the heart of Kigali. It is a popular venue for conferences, meetings, and other events. The center features modern facilities, including meeting rooms, exhibition halls, and a large auditorium. The Kigali Convention Centre is also home to several restaurants and cafes, making it a convenient and comfortable place to host events. The center is located in the heart of Kigali, close to many hotels, restaurants, and other attractions. It is easily accessible by car or public transportation, making it a convenient choice for event organizers and attendees.',
        'price': '\$100',
        'imageUrl': 'assets/illume_orig.jpg',
      },
      {
        'name': 'Gisozi memorial sites',
        'category': 'Museum',
        'rating': 4.8,
        'reviewCount': 150,
        'shortDescription': 'The Kigali genocide memorial is a must visit',
        'detailedDescription':
            'Between April and July 1994, an estimated one million people were killed across Rwanda by armed militias called Interahamwe that targeted Tutsi, but also executed moderate Hutu and Twa people. The victims of the genocide are commemorated in this serial property composed of four memorial sites. Two of the component parts were scenes of massacres: a Catholic church built in the hill of Nyamata in 1980, and a technical school built in the hill of Murambi in 1990. The hill of Gisozi in Kigali City hosts the Kigali Genocide Memorial built in 1999, where more than 250,000 victims have been buried, while the hill of Bisesero in the Western Province hosts a memorial built in 1998, to remember the fight of those who resisted their perpetrators for over two months before being exterminated.',
        'price': '\$50',
        'imageUrl': 'assets/inside-memorial-grounds.jpg',
      },
      {
        'name': 'Tedgas Recreation Center',
        'category': 'Shopping Mall',
        'rating': 4.3,
        'reviewCount': 100,
        'shortDescription':
            'Tedgas Recreation Center is a recreational facility that offers a wide range of activities for visitors of all ages.',
        'detailedDescription':
            'Tedgas Recreation Center is a recreational facility that offers a wide range of activities for visitors of all ages. The center features a variety of attractions, including a swimming pool, a gym, and a children\'s play area. There are also several restaurants and cafes where visitors can enjoy a meal or a snack. Tedgas Recreation Center is a popular destination for families and tourists, and it is a great place to spend a day relaxing and having fun. The center is located in the heart of Kigali, close to many hotels and other attractions. It is easily accessible by car or public transportation, making it a convenient choice for visitors.',
        'price': '\$50',
        'imageUrl': 'assets/maxresdefault.jpg',
      },
      {
        'name': 'Nyandungu eco park',
        'category': 'Shopping Mall',
        'rating': 4.2,
        'reviewCount': 90,
        'shortDescription':
            'Nyandungu eco park is a recreational facility that offers a wide range of activities for visitors of all ages.',
        'detailedDescription':
            'Nyandungu eco park is a recreational facility that offers a wide range of activities for visitors of all ages. The park features a variety of attractions, including a swimming pool, a gym, and a children\'s play area. There are also several restaurants and cafes where visitors can enjoy a meal or a snack. Nyandungu eco park is a popular destination for families and tourists, and it is a great place to spend a day relaxing and having fun. The park is located in the heart of Kigali, close to many hotels and other attractions. It is easily accessible by car or public transportation, making it a convenient choice for visitors.',
        'price': '\$50',
        'imageUrl':
            'assets/a_view_of_the_main_gate_of_nyandungu_urban_wetland_eco_tourism_park_on_august_18_sam_ngendahimana_1.jpg',
      },
      {
        'name': 'Fazenda Sengha',
        'category': 'Art Gallery',
        'rating': 4.6,
        'reviewCount': 110,
        'shortDescription':
            'Fazenda Sengha is a vibrant art gallery that showcases the work of local and international artists.',
        'detailedDescription':
            'Fazenda Sengha is a vibrant art gallery that showcases the work of local and international artists. The gallery features a wide range of art, including paintings, sculptures, and installations. There are also regular exhibitions and events that highlight the work of emerging artists. Fazenda Sengha is a popular destination for art lovers and collectors, and it is a great place to discover new talent and add to your collection. The gallery is located in the heart of Kigali, close to many hotels and other attractions. It is easily accessible by car or public transportation, making it a convenient choice for visitors.',
        'price': '\$50',
        'imageUrl':
            'assets/images.jpeg',
      },
      {
        'name': 'Kigali Golf Club',
        'category': 'Golf Course',
        'rating': 4.7,
        'reviewCount': 130,
        'shortDescription':
            'The Kigali Golf Club is a premier golf course that offers a challenging and scenic golfing experience.',
        'detailedDescription':
            'The Kigali Golf Club is a premier golf course that offers a challenging and scenic golfing experience. The club features an 18-hole course that is suitable for golfers of all skill levels. There are also practice facilities, including a driving range and putting green. The Kigali Golf Club is a popular destination for both locals and tourists, and it is a great place to spend a day on the links. The club is located in the heart of Kigali, close to many hotels and other attractions. It is easily accessible by car or public transportation, making it a convenient choice for golfers.',
        'price': '\$50',
        'imageUrl': 'assets/images-golf.jpeg',
      },
      {
        'name': 'Kigali Arena',
        'category': 'Sports Arena',
        'rating': 4.4,
        'reviewCount': 140,
        'shortDescription':
            'The Kigali Arena is a state-of-the-art sports arena that hosts a wide range of sporting events and concerts.',
        'detailedDescription':
            'The Kigali Arena is a state-of-the-art sports arena that hosts a wide range of sporting events and concerts. The arena features a large seating capacity and modern facilities, making it a popular venue for basketball games, volleyball matches, and other sporting events. The Kigali Arena is also a popular concert venue, hosting performances by local and international artists. The arena is located in the heart of Kigali, close to many hotels and other attractions. It is easily accessible by car or public transportation, making it a convenient choice for sports fans and concert-goers.',
        'price': '\$50',
        'imageUrl':
            'assets/images-arena.jpeg',
      },
      {
        'name': 'Kigali Public Library',
        'category': 'Library',
        'rating': 4.5,
        'reviewCount': 120,
        'shortDescription':
            'The Kigali Public Library is a modern library that offers a wide range of books and resources for the community.',
        'detailedDescription':
            'The Kigali Public Library is a modern library that offers a wide range of books and resources for the community. The library features a large collection of books, including fiction, non-fiction, and reference materials. There are also computers and internet access for patrons to use. The Kigali Public Library is a popular destination for students, researchers, and book lovers, and it is a great place to spend a quiet afternoon reading or studying. The library is located in the heart of Kigali, close to many hotels and other attractions. It is easily accessible by car or public transportation, making it a convenient choice for visitors.',
        'price': '\$50',
        'imageUrl': 'assets/kplfrontqq.jpg',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Visit Kigali'),
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            tooltip: 'Admin Login',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminLoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // List of Places
          Expanded(
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return PlaceCard(
                  placeName: places[index]['name'],
                  category: places[index]['category'],
                  rating: 1,
                  reviewCount: 2,
                  shortDescription: places[index]['shortDescription'],
                  detailedDescription: places[index]['detailedDescription'],
                  price: places[index]['price'],
                  imageUrl: places[index]['imageUrl'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceCard extends StatefulWidget {
  final String placeName;
  final String category;
  final double rating;
  final int reviewCount;
  final String shortDescription;
  final String price;
  final String imageUrl;
  final String detailedDescription;

  PlaceCard({
    required this.placeName,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.shortDescription,
    required this.price,
    required this.imageUrl,
    required this.detailedDescription,
  });

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlaceDetailsScreen(
                    placeName: widget.placeName,
                    category: widget.category,
                    rating: widget.rating,
                    reviewCount: widget.reviewCount,
                    shortDescription: widget.shortDescription,
                    detailedDescription: widget.detailedDescription,
                    price: widget.price,
                    imageUrl: widget.imageUrl,
                  )),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.network(widget.imageUrl,
                  // fit: BoxFit.cover, width: double.infinity, height: 150),
                  Image(
                    image: AssetImage(widget.imageUrl),
                    fit: BoxFit.cover, width: double.infinity, height: 150),
              SizedBox(height: 8),
              Text(widget.placeName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(widget.category, style: TextStyle(color: Colors.grey)),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text('${widget.rating} (${widget.reviewCount} reviews)',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 8),
              Text(widget.shortDescription,
                  maxLines: 2, overflow: TextOverflow.ellipsis),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.price,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.bookmark_border),
                        onPressed: () {
                          // Implement bookmark functionality
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
