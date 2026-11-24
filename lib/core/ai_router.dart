// محرك التوجيه الذكي المتقدم للنماذج والأدوات (Advanced AI Router)
enum AIModelType {
  reasoning,     // التفكير والاستدلال والتحليل العميق
  fast,          // المحادثة السريعة والطبيعية
  coding,        // هندسة البرمجيات والأكواد
  vision,        // تحليل الصور والرؤية (OCR)
  imageGen,      // استوديو توليد وتصميم الصور
  document,      // قراءة وتحليل وتلخيص المستندات (PDF, Word, Excel)
  media,         // الصوت والفيديو والترجمة الفورية
  education,     // التعليم وشرح الدروس والاختبارات والكتابة
  dataAnalysis,  // تحليل وتنظيف البيانات والتقارير
  workflow,      // تنفيذ المهام متعددة الخطوات عبر الوكلاء
  search,        // البحث المعرفي والتحقق من المصادر
  comparison,    // المقارنات والترشيحات الذكية
}

class AIRouter {
  static AIModelType autoRoute(String prompt, {String? previousContext}) {
    final lower = prompt.toLowerCase().trim();
    final combined = "$previousContext $lower".toLowerCase();

    // 1. المتابعات السياقية
    if (lower == "كمل" || lower == "واصل" || lower.contains("أكمل") || lower.contains("اعملهالي") || lower.contains("نفذ")) {
      if (combined.contains("كود") || combined.contains("برمج")) return AIModelType.coding;
      if (combined.contains("صمم") || combined.contains("صورة")) return AIModelType.imageGen;
      if (combined.contains("قارن") || combined.contains("رشح")) return AIModelType.comparison;
      if (combined.contains("ملف") || combined.contains("تقرير")) return AIModelType.document;
      return AIModelType.fast;
    }

    if (lower.contains("عدل ده") || lower.contains("غير ده") || lower.contains("خليه أفخم")) {
      return AIModelType.reasoning;
    }

    // 2. البرمجة والأكواد
    if (_matchesAny(lower, ["كود", "برمج", "flutter", "python", "javascript", "html", "sql", "bug", "class ", "function", "تطبيق", "موقع"])) {
      return AIModelType.coding;
    }

    // 3. المقارنات والترشيحات
    if (_matchesAny(lower, ["قارن", "ما الفرق", "الفرق بين", "مقارنة", "رشح", "اقتراح", "أفضل", "ما هو أفضل"])) {
      return AIModelType.comparison;
    }

    // 4. البحث والتحقق
    if (_matchesAny(lower, ["ابحث", "بحث", "أحدث", "اخبار", "موقع", "ما هي", "من هو", "معلومات عن"])) {
      return AIModelType.search;
    }

    // 5. تحليل الصور والرؤية (Vision)
    if (_matchesAny(lower, ["صورة", "ocr", "استخرج النص من الصورة", "تحليل الصورة"])) {
      return AIModelType.vision;
    }

    // 6. توليد الصور (Image Studio)
    if (_matchesAny(lower, ["صمم صورة", "ارسم", "لوحة", "توليد صورة", "ai image"])) {
      return AIModelType.imageGen;
    }

    // 7. المستندات والملفات (PDF, Word, Excel)
    if (_matchesAny(lower, ["ملف", "pdf", "word", "excel", "csv", "مستند", "تلخيص ملف", "استخراج جدول"])) {
      return AIModelType.document;
    }

    // 8. الصوت والفيديو والترجمة
    if (_matchesAny(lower, ["ترجم", "translate", "صوت", "تسجيل", "فيديو", "تفريغ الصوت"])) {
      return AIModelType.media;
    }

    // 9. التعليم والكتابة وتحليل البيانات
    if (_matchesAny(lower, ["اشرح", "تعليم", "مقال", "قصص", "إحصاء", "بيانات", "اختبار", "quiz"])) {
      return AIModelType.education;
    }

    // 10. مهام الوكلاء المتعددين
    if (_matchesAny(lower, ["مهمة معقدة", "خطوات", "سير عمل", "workflow"])) {
      return AIModelType.workflow;
    }

    return AIModelType.fast;
  }

  static bool _matchesAny(String text, List<String> keywords) {
    for (var kw in keywords) {
      if (text.contains(kw)) return true;
    }
    return false;
  }

  static String getModelName(AIModelType type) {
    switch (type) {
      case AIModelType.reasoning: return "NOVATREX Reasoning & DeepThink";
      case AIModelType.fast: return "NOVATREX Speed Engine";
      case AIModelType.coding: return "NOVATREX CodeArchitect";
      case AIModelType.vision: return "NOVATREX Vision OCR";
      case AIModelType.imageGen: return "NOVATREX Image Studio";
      case AIModelType.document: return "NOVATREX Document Intelligence";
      case AIModelType.media: return "NOVATREX Media & Translator";
      case AIModelType.education: return "NOVATREX Education & Content Studio";
      case AIModelType.dataAnalysis: return "NOVATREX Data Analytics";
      case AIModelType.workflow: return "NOVATREX Agent Workflow";
      case AIModelType.search: return "NOVATREX SearchAgent";
      case AIModelType.comparison: return "NOVATREX Comparator";
    }
  }
}
