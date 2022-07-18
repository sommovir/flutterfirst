// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
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
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: getDataFromAPI,
          child: const Icon(Icons.refresh),
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
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
