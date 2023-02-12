//creating a database and performing CRUD operations on it.
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/note.dart';


class NotesDatabase{

  // private constructor.
  NotesDatabase._init();

  // global field instance calling constructor.
  static final NotesDatabase instance = NotesDatabase._init();

  // Database class is part of sqflite package.
  static Database? _database;

  // makes sure that the connection is open and creates database if not already initialized.
  Future<Database> get database async{
    // checks if database is already initialized.
    if(_database != null) {
      return _database!;
    }
    // if database is null then a new database is initialized.
    _database = await _initDatabase('Notes.db'); // custom function of type database.
    return _database!;
  }

  // new method to initialize a database is not already.
  Future<Database> _initDatabase(String filepath) async{

    //default storage location specified according to our device's platform.
    final databasePath = await getDatabasesPath(); // you can use path_provider for setting any desired location inside our device filesystem.

    // join both dafault location and database name.
    final path = join(databasePath,filepath);
    // perform operation on database such as create and update and reference them in their respective methods.
    return await openDatabase(path, version: 1, onCreate: _createDB);
    // if you want more fields you can do it by onUpgrade method.
    // increment the version by 1 for a new version of your database and then it checks onUpgrade method for changes.
  }

  // Database schema is defined || and is only executed if the database in not already created.
  Future _createDB(Database db, int version) async{

    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';

    // if you want to create multiple datatables then simply duplicate the below given code.
    await db.execute(''' 
    CREATE TABLE $TABLE_NOTES (
      ${NoteFields.id} $idType,
      ${NoteFields.isImportant} $boolType,
      ${NoteFields.number} $integerType,
      ${NoteFields.title} $textType,
      ${NoteFields.description} $textType,
      ${NoteFields.time} $textType
    )
    ''');
  }

  // we want to persist the Note inside our database so ...
  Future<Note> create(Note note) async{
    final db = await instance.database; // reference to our database.
    // insert takes table name and the note || note should be a map containing the column name and then the data that you want to insert into it.
    final id = await db.insert(TABLE_NOTES,note.toJson());
    return note; // continue from here and video 10:00. delete Zombie later
  }

  // closing database.
  Future close() async{
    // access the database which you have created before.
    final db = await instance.database;
    db.close();
  }
}