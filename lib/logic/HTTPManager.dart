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

  Future<int> registerAccount(Account a) async {
    final uri = Uri.parse("http://lin.java-injection.dev/register");

    var jsonBody = Account.toJson(a);

    final response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id': a.id,
          'username': a.username,
          'password': a.password,
          'money': a.money,
        }));

    return response.statusCode;
  }
}
