import 'package:kigali/models/Booking.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app.db');
    return openDatabase(
      path,
      version: 2,  // Incremented version number to trigger onUpgrade
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE bookings(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            placeName TEXT,
            bookingDate TEXT,
            price TEXT,
            userName TEXT,
            phoneNumber TEXT,
            comment TEXT
          )
        ''');

        db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            password TEXT
          )
        ''');

        db.insert('users', {
          'username': 'admin',
          'password': 'password',
        });
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < 2) {
          db.execute('''
            ALTER TABLE bookings 
            ADD COLUMN userName TEXT
          ''');
          db.execute('''
            ALTER TABLE bookings 
            ADD COLUMN phoneNumber TEXT
          ''');
          db.execute('''
            ALTER TABLE bookings 
            ADD COLUMN comment TEXT
          ''');
        }
      },
    );
  }

  Future<int> insertBooking(Booking booking) async {
    Database db = await database;
    return await db.insert('bookings', booking.toMap());
  }

  Future<List<Booking>> getBookings() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('bookings');
    return List.generate(maps.length, (i) {
      return Booking(
        placeName: maps[i]['placeName']??'',
        bookingDate: maps[i]['bookingDate']??'',
        price: maps[i]['price']??'',
        userName: maps[i]['userName']??'',
        phoneNumber: maps[i]['phoneNumber']??'',
        comment: maps[i]['comment']??'',
      );
    });
  }

  Future<void> deleteBooking(int id) async {
    Database db = await database;
    await db.delete('bookings', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> createUser(String username, String password) async {
    Database db = await database;
    await db.insert('users', {
      'username': username,
      'password': password,
    });
  }

  Future<bool> authenticateUser(String username, String password) async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    return maps.isNotEmpty;
  }
}
