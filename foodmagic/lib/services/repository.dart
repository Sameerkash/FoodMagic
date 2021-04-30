import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:appwrite/appwrite.dart';
import 'package:foodmagic/models/user/user.dart';
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

  // Store
  final _store = sembast.stringMapStoreFactory.store('common_store');

  /// Keys
  static const USERKEY = 'userkey';
  static const SESSIONKEY = 'sessionkey';

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

  /// Get the current Logged In user
  Future<Map<String, Object>> getLoggedInUser() async {
    try {
      final user = await _store.record(SESSIONKEY).get(await getDb());
      // final appuser = AppUser.fromJson(user);
      if (user != null)
        return user;
      else
        return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future createUser({String name, String password, String email}) async {
    try {
      final Response user =
          await account.create(email: email, password: password, name: name);
      print(user.statusCode);

      if (user.statusCode == 201) {
        final Response session =
            await account.createSession(email: email, password: password);

        _store.record(SESSIONKEY).put(await getDb(), session.data);
      }
    } catch (e) {}
  }

  Future signInUser({String password, String email}) async {
    final Response session =
        await account.createSession(email: email, password: password);
    print(session);
    if (session.statusCode == 201) {
      _store.record(SESSIONKEY).put(await getDb(), session.data);
    }
  }

  Future signOut() async {
    try {
      final session = await _store.record(SESSIONKEY).get(await getDb());
      await account.deleteSession(sessionId: session["\$id"]);
      await _store.record(SESSIONKEY).delete(await getDb());
    } catch (e) {}
  }
}
