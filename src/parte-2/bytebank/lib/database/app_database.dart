import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bytebank/models/contact.dart';

Future<Database> createDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bytebank.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute("CREATE TABLE contacts ( "
        " id INTEGER PRIMARY KEY,"
        " name TEXT,"
        " account_numer INTEGER"
        " )");
  }, version: 1, onDowngrade: onDatabaseDowngradeDelete);
}

Future<int> save(Contact contact) async {
  var db = await createDatabase();
  final Map<String, dynamic> contactMap = Map();
  contactMap['id'] = contact.id;
  contactMap['name'] = contact.name;
  contactMap['account_numer'] = contact.accountNumber;
  return db.insert('contacts', contactMap);
}

Future<List<Contact>> findAll() async {
  var db = await createDatabase();
  var maps = await db.query('contacts');
  final List<Contact> listaContacs = List();
  for (Map<String, dynamic> map in maps) {
    final Contact contact =
        Contact(map["id"], map["name"], map["account_numer"]);
    listaContacs.add(contact);
  }
  return listaContacs;
}
