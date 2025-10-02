import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  void _checkPreferences() {
    if (preferences == null) throw SharedNotIntializeException();
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPreferences();
    await preferences?.setString(key.name, value);
  }

  String? getString(SharedKeys key) {
    _checkPreferences();
    return preferences?.getString(key.name);
  }

  Future<bool> removeString(SharedKeys key) async {
    _checkPreferences();
    return (await preferences?.remove(key.name) ?? false);
  }
}

enum SharedKeys { counter, users, email }

class SharedNotIntializeException implements Exception {
  @override
  String toString() {
    return 'Your prefences has not intialized right now';
  }
}
