import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:appwrite/appwrite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart' as sembast;
import 'package:sembast/sembast_io.dart';

class Repository {
  /// Appwrite client
  final Client client = Client();

  /// Appwrite account service

  Account account;

  /// Appwrite database serivce

  Database database;

  /// Appwrite storage service

  Storage storage;

  /// Sembast local database serivce

  sembast.Database _db;

  /// File path to a file in the current directory
  String dbName = 'foodmagic.db';

  /// dbFactory instance
  sembast.DatabaseFactory dbFactory = databaseFactoryIo;

  /// Call await getDb when modifying the store
  Future<sembast.Database> getDb() async {
    if (_db == null) {
      var path = (await getApplicationSupportDirectory()).path + "/" + dbName;
      _db = await dbFactory.openDatabase(path);
    }
    return _db;
  }

  Repository() {
    // load environment vairables
    client
        .setEndpoint('https://${env['IP']}/v1') // Your Appwrite Endpoint
        .setProject(env['PROJECT_ID']) // Your project ID
        .setSelfSigned();

    //intialize appwrite services
    database = Database(client);
    storage = Storage(client);
    account = Account(client);
  }

  Future createUser({String name, String password, String email}) async {
    try {
      Response user =
          await account.create(email: email, password: password, name: name);

      print(user);
    } catch (e) {}
  }

  Future signInUser({String password, String email}) async {}
}
