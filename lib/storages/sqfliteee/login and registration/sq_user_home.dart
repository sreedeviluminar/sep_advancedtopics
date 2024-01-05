import 'package:flutter/material.dart';

class UserHome extends StatelessWidget {
  final data;
  UserHome({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var name = data[0]['name'];
    var cemail = TextEditingController();
    var cname = TextEditingController();

    void editData(int id) {
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
                    SizedBox(height: 15,),

                    ElevatedButton(
                        onPressed: () async {}, child: Text("Update Data"))
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
              data[0]['name'],
              style: const TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              data[0]['email'],
              style: const TextStyle(fontSize: 15),
            ),
            trailing: IconButton(
                onPressed: () {
                  editData(data[0]['id']);
                },
                icon: Icon(Icons.edit)),
          ),
        ));
  }
}
