import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:surf/presenter/StateListPerson.dart';

import 'DataServer.dart';

class LoadServerData {
  StateListPersonForModel _stateListPerson;

  LoadServerData(this._stateListPerson);

  String url = 'https://jsonplaceholder.typicode.com/users';

  void loadServer() async {
    try {
      await http.get(url).then(_processResponse);
    } catch (e) {
      _stateListPerson.error();
    }
  }

  List<DataServer> _listGetDataServer = List();

  void _processResponse(http.Response response) {
    print(response.statusCode);
    if (response.statusCode == 200) {
      List<dynamic> list = (json.decode(response.body) as List<dynamic>);
      for (var i = 0; list.length > i; ++i) {
        Map<String, dynamic> map = list[i];
        _listGetDataServer.add(DataServer.fromJson(map));
      }
      _stateListPerson.setData(_listGetDataServer);
    } else
      _stateListPerson.error();
  }
}
