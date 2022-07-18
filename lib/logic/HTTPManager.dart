import 'package:sampleproject/logic/account.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HTTPManager {
  static HTTPManager? _instance; //sperando sia null

  HTTPManager._(); //si è strano ma è un costruttore privato

  //PATTERN SINGLETON
  static HTTPManager? getInstance() {
    _instance ??=
        HTTPManager._(); //if _instance è nullo usa il costruttore priv.
    return _instance;
  }

  Future<List<Account>> getAccountFromServer() async {
    final url = Uri.parse('http://lin.java-injection.dev/test/accounts');

    final res = await http.get(url);

    var accountJson = json.decode(res.body);

    List<Account> accounts = [];

    for (var p in accountJson) {
      accounts.add(Account.fromJson(p));
    }

    return accounts;
  }
}
