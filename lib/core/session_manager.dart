import 'package:shared_preferences/shared_preferences.dart';

// مدير حفظ جلسة المستخدم وحالة تسجيل الدخول القائمة بشكل دائم (Session Manager)
class SessionManager {
  static const String _prefKeyIsLoggedIn = 'novatrex_is_logged_in';
  static const String _prefKeyEmail = 'novatrex_user_email';
  static const String _prefKeyPhone = 'novatrex_user_phone';
  static const String _prefKeyName = 'novatrex_user_name';

  static bool isLoggedIn = false;
  static String userEmail = "user@novatrex.ai";
  static String userPhone = "";
  static String userName = "مستخدم NOVATREX AI";

  // تحميل حالة الجلسة عند بدء التطبيق
  static Future<void> initSession() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      isLoggedIn = prefs.getBool(_prefKeyIsLoggedIn) ?? false;
      userEmail = prefs.getString(_prefKeyEmail) ?? "user@novatrex.ai";
      userPhone = prefs.getString(_prefKeyPhone) ?? "";
      userName = prefs.getString(_prefKeyName) ?? "مستخدم NOVATREX AI";
    } catch (_) {}
  }

  // دالة تسجيل الدخول وحفظ البيانات بشكل دائم
  static Future<void> login({String? email, String? phone, String? name}) async {
    isLoggedIn = true;
    if (email != null && email.isNotEmpty) userEmail = email;
    if (phone != null && phone.isNotEmpty) userPhone = phone;
    if (name != null && name.isNotEmpty) userName = name;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefKeyIsLoggedIn, true);
      await prefs.setString(_prefKeyEmail, userEmail);
      await prefs.setString(_prefKeyPhone, userPhone);
      await prefs.setString(_prefKeyName, userName);
    } catch (_) {}
  }

  // دالة تسجيل الخروج ومسح بيانات الجلسة الدائمة
  static Future<void> logout() async {
    isLoggedIn = false;
    userEmail = "";
    userPhone = "";
    userName = "";

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefKeyIsLoggedIn, false);
      await prefs.remove(_prefKeyEmail);
      await prefs.remove(_prefKeyPhone);
      await prefs.remove(_prefKeyName);
    } catch (_) {}
  }
}
