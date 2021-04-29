import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:appwrite/appwrite.dart';

class Repository {
  final Client client = Client();
  Account account;

  Database database;
  Storage storage;
  static Repository intializeApp() => Repository._initializeApp();

  Repository._initializeApp() {
// load environment vairables

    client
        .setEndpoint('https://${env['IP']}/v1') // Your Appwrite Endpoint
        .setProject(env['PROJECT_ID']) // Your project ID
        .setSelfSigned();

    database = Database(client);
    storage = Storage(client);
    account = Account(client);
  }

  Future createUser({String name, String password, String email}) async {

    print(name);
    print(email);
    print(password);

    Response user =
        await account.create(email: email, password: password, name: name);

    print(user);
  }

  Future signInUser({String name, String password, String email}) async {}
}
