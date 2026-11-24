// مدير الذاكرة والمشروعات (Memory Manager)
class MemoryManager {
  static bool isMemoryEnabled = true;

  static final List<Map<String, String>> _savedPreferences = [
    {"key": "اللغة المفضلة", "value": "العربية"},
    {"key": "مجال الاهتمام", "value": "الذكاء الاصطناعي وتطوير التطبيقات"},
    {"key": "الهدف الحالي", "value": "بناء تطبيق متكامل واستكشاف فرص العمل"},
  ];

  static final List<Map<String, dynamic>> _workspaces = [
    {
      "id": "proj_1",
      "name": "مشروع NOVATREX AI الشامل",
      "chatsCount": 5,
      "filesCount": 3,
      "lastUpdated": "اليوم"
    },
    {
      "id": "proj_2",
      "name": "تجهيز CV والتقديم على الوظائف",
      "chatsCount": 8,
      "filesCount": 2,
      "lastUpdated": "أمس"
    }
  ];

  static List<Map<String, String>> getPreferences() {
    return _savedPreferences;
  }

  static List<Map<String, dynamic>> getWorkspaces() {
    return _workspaces;
  }

  static void addPreference(String key, String value) {
    _savedPreferences.add({"key": key, "value": value});
  }

  static void clearMemory() {
    _savedPreferences.clear();
  }
}
