import 'package:hive/hive.dart';

class HivePreferenceUtil {
  static late Box box;

  static Future<void> init() async {
    box = await Hive.openBox('appBox');
  }

  static Future<void> saveData(
      { required String value}) async {
    await box.put('token', value);
  }

  static Future<void> saveEmail(
      {required String value}) async {
    await box.put("email", value);
  }

  static Future<void> saveName(
      {required String value}) async {
    await box.put('name', value);
  }

  static Future<String?> getData() async {
    var token = await box.get('token');
    return token is String ? token : null;
  }

  static Future<String?> getEmail() async {

  var email =  await box.get("email");
  return email is String ? email : "" ;
  }

  static Future<String?> getName() async {
    var name =  await box.get("name");
    return name is String ? name : "" ;
  }

  static Future<bool> removeData({required String key}) async {
    if (box.containsKey(key)) {
      await box.delete(key);
      return true;
    }
    return false;
  }
  static Future<void> closeBox() async {
    await box.close();
  }
}


