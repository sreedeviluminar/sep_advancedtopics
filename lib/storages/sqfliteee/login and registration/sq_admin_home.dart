import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/login%20and%20registration/sql_functionn.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  List<Map<String, dynamic>> users = []; // to store all the registered users

  @override
  void initState() {
    getAllUsers();
    super.initState();
  }
/// read all the users from db and update the list or ui
  void getAllUsers() async{
    var usersFromDb = await SQL_Functions.getAllUsers();
    setState(() {
      users = usersFromDb;
    });
  }
  /// delete single user from the list and update the ui
  void deleteUser(int id) async{
    await SQL_Functions.dltUser(id);
    getAllUsers(); // to refresh the ui or list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
        elevation: 8,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(child: Text('${users[index]['id']}'),),
                title: Text(users[index]['name']), // these keys are the column names in the table
                subtitle: Text(users[index]['email']),
                trailing: IconButton(
                    onPressed: () {
                      deleteUser(users[index]['id']);
                    }, icon: Icon(Icons.delete)),
              ),
            );
          }),
    );
  }
}
