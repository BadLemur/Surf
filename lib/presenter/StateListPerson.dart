import 'package:surf/model/DataServer.dart';
import 'package:surf/model/LoadServerData.dart';
import 'package:surf/view/ListPersonScreen.dart';

abstract class StateListPersonInterface {
  void init();
}

abstract class StateListPersonForModel {
  void setData(List<DataServer> data);

  void error();
}

class StateListPerson
    implements StateListPersonInterface, StateListPersonForModel {
  LoadServerData _loadServerData;
  ListPersonInterface _widget;

  StateListPerson(this._widget) {
    _loadServerData = LoadServerData(this);
  }

  @override
  void init() {
    _loadServerData.loadServer();
  }

  @override
  void setData(List<DataServer> data) {
    _widget.showData(data);
  }

  @override
  void error() {
    _widget.error();
  }
}
