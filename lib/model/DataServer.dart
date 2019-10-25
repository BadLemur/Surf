

class DataServer {
  final String name;
  final String email;
  final String job;

  DataServer({this.name, this.email, this.job});

  factory DataServer.fromJson(Map<String, dynamic> parsedJson) {
    return new DataServer(
      name: parsedJson['name'],
      email: parsedJson['email'],
      job: parsedJson['company']['name'],
    );
  }
}