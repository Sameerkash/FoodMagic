import 'package:appwrite/appwrite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodmagic/models/fooditem/food.item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart' as sembast;
import 'package:sembast/sembast_io.dart';

class Repository {
  /// Appwrite client
  final Client client = Client();

  /// Appwrite account service

  late Account account;

  /// Appwrite database serivce

  late Database database;

  /// Appwrite storage service

  late Storage storage;

  /// Sembast local database serivce

  late sembast.Database? _db;

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
    return _db!;
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
  Future<Map<String, Object?>?> getLoggedInUser() async {
    try {
      final user = await (_store.record(SESSIONKEY).get(await (getDb())));
      // final appuser = User.fromJson(user);
      print(user);

      if (user != null)
        return user;
      else
        return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future createUser(
      {required String name,
      required String password,
      required String email}) async {
    try {
      final Response user =
          await account.create(email: email, password: password, name: name);
      print(user.statusCode);

      if (user.statusCode == 201) {
        final Response session =
            await account.createSession(email: email, password: password);

        _store.record(SESSIONKEY).put(await (getDb()), session.data);
      }
    } catch (e) {}
  }

  Future<void> signInUser(
      {required String password, required String email}) async {
    final Response session =
        await account.createSession(email: email, password: password);
    print(session);
    if (session.statusCode == 201) {
      _store.record(SESSIONKEY).put(await (getDb()), session.data);
    }
  }

  Future signOut() async {
    try {
      final session = await (_store.record(SESSIONKEY).get(await (getDb())));
      await account.deleteSession(sessionId: session!["\$id"] as String);
      await _store.record(SESSIONKEY).delete(await (getDb()));
    } catch (e) {}
  }

  Future<List<FoodItem>?> getFoodItems() async {
    try {
      final result = await database.
      listDocuments(collectionId: '608adfe8f0dc4');

      if (result.statusCode == 200) {
        // return result.data;
      }
    } catch (e) {
      print(e);
    }
  }
}

