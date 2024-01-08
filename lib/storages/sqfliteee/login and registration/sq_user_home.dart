import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/login%20and%20registration/sql_functionn.dart';

class UserHome extends StatefulWidget {
  final data;

  UserHome({super.key, required this.data});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  var cemail = TextEditingController();
  var cname = TextEditingController();
  var name,email;

  @override
  void initState() {
    ///fetching the user details and assign it to these instance variables
    name = widget.data[0]['name'];
    email = widget.data[0]['email'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    void editData() {
      setState(() {
        ///setting the current user details to the text fields inside alert box
        cname.text  = name;
        cemail.text = email;
      });

      /// to show a dialogBox
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                "Edit Data",
                style: TextStyle(fontSize: 25),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: cname,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Edit Name"),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: cemail,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Edit Email"),
                  ),
                  const SizedBox(height: 15,),

                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          name = cname.text;
                          email = cemail.text;
                        });
                        updateUser();
                        Navigator.of(context).pop();

                      }, child: Text("Update Data"))
                ],
              ),
              // actions: [
              //   TextButton(onPressed: (){}, child: Text('Yes')),
              //   TextButton(onPressed: (){}, child: Text('No')),
              //   TextButton(onPressed: (){}, child: Text('Cancel'))
              // ],
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome $name"),
          elevation: 5,
        ),
        body: Card(
          child: ListTile(
            leading: const Icon(Icons.person_outline_outlined),
            title: Text(
              '$name',
              style: const TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              '$email',
              style: const TextStyle(fontSize: 15),
            ),
            trailing: IconButton(
                onPressed: () {
                  editData();
                },
                icon: Icon(Icons.edit)),
          ),
        ));
  }

  void updateUser() async {
    await SQL_Functions.update(widget.data[0]['id'], name, email);
  }
}
