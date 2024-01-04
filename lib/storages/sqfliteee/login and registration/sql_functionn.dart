import 'package:sqflite/sqflite.dart' as sql;
class SQL_Functions{

  ///creating database
  static Future<sql.Database> openOrCreateDb() async{
    return sql.openDatabase('users',version: 1,
    onCreate:(sql.Database db, int version) async{
      await createTable(db);
    });
  }

   ///creating table to store user data
  static Future<void> createTable(sql.Database db) async{
    await db.execute('CREATE TABLE userdata (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, email TEXT, password TEXT)');
  }


  static Future<int> addUser(String name, String email, String password) async{
    var db = await SQL_Functions.openOrCreateDb(); // TO OPEN DATABASE
    var data = {'name':name, 'email':email,'password': password}; // here keys are column names values are values from textformfiled
    var id = db.insert('userdata', data) ;
    //  Or
    //var id = db.insert('userdata',{'name':name, 'email':email,'password': password});
    return id;
  }

  

}