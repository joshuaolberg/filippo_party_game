import 'dart:async';
import 'dart:io';

import 'package:filippo_party_game/models/player.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  // Singleton Pattern
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'players.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE players(
     id INTEGER PRIMARY KEY,
     name STRING
    )
    ''');
  }

  Future<List<Player>> getPlayers() async {
    Database db = await instance.database;
    var players = await db.query('players', orderBy: 'name');
    List<Player> playerList = players.isNotEmpty
        ? players.map((e) => Player.fromMap(e)).toList()
        : [];
    print(playerList);
    return playerList;
  }

  add(Player item) async {
    Database db = await instance.database;
    db.insert('players', item.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('players', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Player item) async {
    Database db = await instance.database;
    return await db
        .update('players', item.toMap(), where: 'id = ?', whereArgs: [item.id]);
  }
}
