// نموذج بيانات نظام الوظائف والتوظيف الذكي (AI Jobs System)

enum JobApplicationStatus {
  prepared,        // 🟡 تم تجهيز الطلب
  awaitingApproval,// 🔵 بانتظار موافقة المستخدم
  submitted,       // 🟢 تم التقديم
  underReview,     // 🟠 قيد المراجعة
  rejected,        // 🔴 مرفوض
  interview        // 🟣 تمت دعوة المستخدم للمقابلة
}

class UserProfile {
  String education;
  String specialization;
  List<String> skills;
  List<String> languages;
  String city;
  String preferredJobType; // عمل عن بعد / في مقر الشركة
  String expectedSalary;
  int yearsOfExperience;

  UserProfile({
    this.education = "بكالوريوس نظم معلومات إدارية / حاسبات",
    this.specialization = "تطوير تطبيقات الموبايل والذكاء الاصطناعي",
    List<String>? skills,
    List<String>? languages,
    this.city = "القاهرة / الرياض",
    this.preferredJobType = "عن بعد أو في المقر",
    this.expectedSalary = "حسب الخبرة وسوق العمل",
    this.yearsOfExperience = 2,
  })  : skills = skills ?? ["Flutter", "Dart", "Python", "Excel", "Word", "English B2", "UI Design"],
        languages = languages ?? ["العربية (اللغة الأم)", "الإنجليزية (متقدم)"];
}

class JobOpportunity {
  final String id;
  final String companyName;
  final String jobTitle;
  final String location;
  final String salaryRange;
  final int matchScore; // نسبة التطابق مع مهارات المستخدم e.g. 87%
  final List<String> requiredSkills;
  final List<String> missingSkills;
  JobApplicationStatus status;
  final String applyUrl;
  final String datePosted;

  JobOpportunity({
    required this.id,
    required this.companyName,
    required this.jobTitle,
    required this.location,
    required this.salaryRange,
    required this.matchScore,
    required this.requiredSkills,
    required this.missingSkills,
    this.status = JobApplicationStatus.prepared,
    required this.applyUrl,
    required this.datePosted,
  });
}
