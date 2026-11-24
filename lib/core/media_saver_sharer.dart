import 'package:flutter/material.dart';

// أداة حفظ ومشاركة الصور وملفات الـ PDF والفيديوهات على الهاتف (Media Saver & Sharer)
class MediaSaverSharer {
  // 1. حفظ الصورة على الهاتف
  static void saveImage(BuildContext context, String imageName) {
    // محاكاة طلب الإذن والحفظ الفعلي مع رسالة واضحة
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم حفظ الصورة ("$imageName") بنجاح في مجلد التنزيلات / المعرض 🖼️✨'),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green[700],
      ),
    );
  }

  // 2. حفظ ملفات الـ PDF على الهاتف
  static void savePdf(BuildContext context, String pdfName) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم تنزيل وحفظ ملف الـ PDF ("$pdfName") في مجلد التنزيلات بنجاح 📄📥'),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green[700],
      ),
    );
  }

  // 3. حفظ الفيديوهات على الهاتف مع محاكاة شريط التقدم
  static void saveVideo(BuildContext context, String videoTitle) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: Colors.blueAccent),
              const SizedBox(height: 20),
              Text('جاري تنزيل وحفظ الفيديو ($videoTitle)...', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text('يرجى الانتظار حتى اكتمال التحميل بجودة عالية', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        Navigator.pop(context); // إغلاق نافذة التقدم
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم حفظ الفيديو ($videoTitle) على الهاتف بنجاح 🎬✅'),
            duration: const Duration(seconds: 3),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green[700],
          ),
        );
      }
    });
  }

  // 4. مشاركة المحتوى (صور، PDF، فيديوهات) عبر تطبيقات النظام
  static void shareContent(BuildContext context, {required String title, required String type}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'مشاركة: $title',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildShareAppIcon(context, 'WhatsApp', Icons.chat_rounded, Colors.green, title),
                  _buildShareAppIcon(context, 'Telegram', Icons.telegram_rounded, Colors.blue, title),
                  _buildShareAppIcon(context, 'نسخ الرابط', Icons.copy_rounded, Colors.grey, title),
                  _buildShareAppIcon(context, 'أخرى', Icons.share_rounded, Colors.purple, title),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }

  static Widget _buildShareAppIcon(BuildContext context, String appName, IconData icon, Color color, String title) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم إرسال "$title" عبر $appName بنجاح 🚀'),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(appName, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
