// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sampleproject/logic/HTTPManager.dart';

import '../logic/account.dart';

class JsonListResponse extends StatefulWidget {
  @override
  State<JsonListResponse> createState() => _JsonListResponseState();
}

List<Account> accounts = [];

class _JsonListResponseState extends State<JsonListResponse> {
  bool isLoaded = false;

  getDataFromAPI() async {
    accounts = await HTTPManager.getInstance()!.getAccountFromServer();
    if (accounts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDataFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    //getDataFromAPI();
    return Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: getDataFromAPI,
              child: const Icon(Icons.refresh),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: changePage,
              child: const Icon(Icons.add),
            ),
          ],
        ),
        body: Visibility(
          visible: isLoaded,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView.builder(
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Column(
                  children: [
                    ListTile(
                      dense: false,
                      leading: Icon(
                        Icons.person,
                        size: 40,
                      ),
                      title: Text(accounts[index].username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      subtitle: Text(
                          "Balance: €${accounts[index].money}\nID: ${accounts[index].id}"),
                      isThreeLine: true,
                      trailing: Icon(Icons.abc),
                      onLongPress: () {
                        setState(() {
                          accounts.removeAt(index);
                        });
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }

  void changePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => performPostPage()));
  }
}

class performPostPage extends StatefulWidget {
  performPostPage({Key? key}) : super(key: key);

  @override
  State<performPostPage> createState() => _performPostPageState();
}

final usernameController = TextEditingController();
final passwdController = TextEditingController();
final moneyController = TextEditingController();

class _performPostPageState extends State<performPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Create a post",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    labelText: "Username: ",
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.person)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 20, 23, 0),
              child: TextField(
                controller: passwdController,
                decoration: InputDecoration(
                    labelText: "Password: ",
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.remove_red_eye)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 20, 23, 0),
              child: TextField(
                controller: moneyController,
                decoration: InputDecoration(
                    labelText: "Money amount: ",
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.monetization_on_rounded)),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  int code = await performPost();
                  code == 200
                      ? Fluttertoast.showToast(msg: "TOOOP")
                      : Fluttertoast.showToast(msg: "Errore bro");
                },
                child: Text("Perform a post action")),
          ],
        ),
      ),
    );
  }
}

Future<int> performPost() async {
  Account a = Account(0, usernameController.text, passwdController.text,
      int.parse(moneyController.text));

  final responseCode = await HTTPManager.getInstance()!.registerAccount(a);

  return responseCode;
}
