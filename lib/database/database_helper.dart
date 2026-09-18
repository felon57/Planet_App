import 'package:planet_app/models/plant.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();
  static const String _databaseName = 'plants.db';
  static const String tablePlants = 'plants';

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    final String databasePath = await getDatabasesPath();
    _database = await openDatabase(
      '$databasePath/$_databaseName',
      version: 1,
      onCreate: (database, version) async {
        await database.execute('''
          CREATE TABLE $tablePlants (
            plantId INTEGER PRIMARY KEY,
            price INTEGER NOT NULL,
            size TEXT NOT NULL,
            rating REAL NOT NULL,
            humidity INTEGER NOT NULL,
            temperature TEXT NOT NULL,
            category TEXT NOT NULL,
            plantName TEXT NOT NULL,
            imageURL TEXT NOT NULL,
            isFavorated INTEGER NOT NULL,
            decription TEXT NOT NULL,
            isSelected INTEGER NOT NULL
          )
        ''');
      },
    );
    return _database!;
  }

  Future<void> initialize() async {
    final Database db = await database;
    final int count =
        Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM $tablePlants'),
        ) ??
        0;

    if (count == 0) {
      await db.transaction((transaction) async {
        for (final Plant plant in Plant.plantList) {
          await transaction.insert(tablePlants, plant.toMap());
        }
      });
    }

    Plant.plantList = await getPlants();
  }

  Future<List<Plant>> getPlants() async {
    final Database db = await database;
    final List<Map<String, Object?>> rows = await db.query(
      tablePlants,
      orderBy: 'plantId',
    );
    return rows.map(Plant.fromMap).toList();
  }

  Future<Plant?> getPlant(int plantId) async {
    final Database db = await database;
    final List<Map<String, Object?>> rows = await db.query(
      tablePlants,
      where: 'plantId = ?',
      whereArgs: [plantId],
      limit: 1,
    );
    return rows.isEmpty ? null : Plant.fromMap(rows.first);
  }

  Future<void> updatePlant(Plant plant) async {
    final Database db = await database;
    await db.update(
      tablePlants,
      plant.toMap(),
      where: 'plantId = ?',
      whereArgs: [plant.plantId],
    );
  }
}
