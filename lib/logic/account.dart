class Account {
  int _id;
  final String _username;
  final String _password;
  int _money = 100;

  Account(this._id, this._username, this._password, this._money);

  int get id => _id;
  String get username => _username;
  String get password => _password;
  int get money => _money;

  void setId(int i) => _id = i;

  factory Account.fromJson(Map<String, dynamic> json) {
    //List<Game> games = [];
    final id = json['id'] as int;
    final username = json['username'] as String;
    final password = json['password'] as String;
    final money = json['money'] as int;

    // if (json['games'] != null) {
    //   final jsonGames = json['games'] as List<dynamic>;
    //   for (var jsonGame in jsonGames) {
    //     games.add(Game.fromJson(jsonGame));
    //   }
    // }

    return Account(id, username, password, money);
  }

  static Map<String, dynamic> toJson(Account value) => {
        'id': value.id,
        'username': value.username,
        'pwd': value.password,
        'money': value.money,
        //'games': value.games
      };

  // String toGamesString() {
  //   String s_games = "";
  //   for (Game g in games) {
  //     s_games += (g.toString() + "\n");
  //   }
  //   s_games += "--------------------";
  //   return s_games;
  // }

  @override
  String toString() {
    return "id: $_id, username: $_username, psswd: $_password, money: $_money" +
        " ";
  }
}
