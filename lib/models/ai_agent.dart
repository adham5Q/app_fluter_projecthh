// وكلاء الذكاء الاصطناعي المتخصصون
enum AgentRole {
  manager,   // وكيل المدير (المُنسق الرئيسي)
  search,    // وكيل البحث
  coding,    // وكيل البرمجة
  design,    // وكيل التصميم
  data,      // وكيل البيانات (Excel / CSV / JSON)
  writing,   // وكيل الكتابة
  vision,    // وكيل الرؤية
  security,  // وكيل الأمان
  testing    // وكيل الاختبار
}

class AIAgent {
  final String id;
  final String name;
  final AgentRole role;
  final String icon;
  final String description;
  double progress;
  String status;

  AIAgent({
    required this.id,
    required this.name,
    required this.role,
    required this.icon,
    required this.description,
    this.progress = 0.0,
    this.status = "جاهز للعمل",
  });
}
