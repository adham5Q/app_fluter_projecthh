// نظام الأمان والخصوصية والأخلاقيات الصارم لمنصة NOVATREX AI (AI ONE)
class SafetyGuardrails {
  // الكلمات والمواضيع السياسية والعسكرية الممنوعة
  static const List<String> _forbiddenTopics = [
    "سياسة", "سياسي", "سياسية", "حرب", "حروب", "جيش", "جيوش", "عسكري", "عسكرية",
    "انقلاب", "حزب", "أحزاب", "رئيس دولة", "صراع مسلح", "سلاح", "أسلحة",
    "إرهاب", "عدوان", "جبهة قتال", "معركة", "استخبارات عسكرية", "نزاع سياسي"
  ];

  // دالة فحص نص المستخدم وتحديد ما إذا كان يتطرق لموضوع سياسي أو عسكري
  static bool containsForbiddenTopic(String text) {
    final lower = text.toLowerCase();
    for (var word in _forbiddenTopics) {
      if (lower.contains(word)) {
        return true;
      }
    }
    return false;
  }

  // رسالة الرفض عند التطرق لموضوع محظور
  static const String forbiddenTopicRefusal = 
    "⚠️ نعتذر، بصفتي نظام الذكاء الاصطناعي الشامل (NOVATREX AI)، ألتزم بالحياد والأخلاقيات والسياسات الصارمة التي تمنع مناقشة المواضيع السياسية، العسكرية، الحروب، والصراعات.\n\n"
    "💡 أستطيع مساعدتك بكل كفاءة في مجالات: التكنولوجيا، البرمجة، التوظيف وسوق العمل، الأبحاث، تحليل البيانات، التصميم، وإنشاء التطبيقات!";

  // 1. الشفافية والتوضيح حول حدود الذكاء الاصطناعي واحتمالية الخطأ
  static String addTransparencyDisclaimer(String aiResponse) {
    if (aiResponse.contains("⚠️") || aiResponse.contains("نعتذر")) {
      return aiResponse;
    }
    return "$aiResponse\n\n*(ℹ️ ملاحظة أخلاقية وشفافة: هذه الإجابة مُولدة بواسطة الذكاء الاصطناعي، وقد تحتاج إلى مراجعة بشرية خاصة في المجالات القانونية، الطبية، أو المالية).*";
  }

  // 2. التحقق من الحاجة لموافقة المستخدم الصريحة قبل العمليات الحساسة
  static bool requiresUserPermission(String actionType) {
    const sensitiveActions = [
      "read_files",
      "delete_files",
      "send_email",
      "submit_job_application",
      "execute_code",
      "make_purchase",
      "computer_control",
      "share_personal_data",
      "external_api_call"
    ];
    return sensitiveActions.contains(actionType);
  }

  // 3. التحقق من منع الاحتيال وانتحار الهوية أو الإضرار بالآخرين
  static bool containsHarmfulIntent(String text) {
    final lower = text.toLowerCase();
    final harmfulKeywords = [
      "اختراق", "تهكير", "انتحال", "احتيال", "تزوير", "ابتزاز", "تخريب", "تجسس",
      "hack", "phishing", "scam", "fraud", "exploit", "malware"
    ];
    for (var kw in harmfulKeywords) {
      if (lower.contains(kw)) return true;
    }
    return false;
  }

  static const String harmfulIntentRefusal = 
    "⚠️ عذراً، لا يمكنني تنفيذ طلبات تتعلق بالاحتيال، الاختراق، أو الإضرار بالآخرين، التززاماً بمعايير الأمان والأخلاقيات والمسؤولية.";
}
