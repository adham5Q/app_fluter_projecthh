import 'package:flutter/material.dart';
import '../../core/app_colors.dart';

// منشئ التطبيقات ومحرر الأكواد الذكي (App Generator & Code Studio)
class AppBuilderScreen extends StatefulWidget {
  const AppBuilderScreen({super.key});

  @override
  State<AppBuilderScreen> createState() => _AppBuilderScreenState();
}

class _AppBuilderScreenState extends State<AppBuilderScreen> {
  final TextEditingController _appPromptController = TextEditingController();
  bool _isBuilding = false;
  String _resultMessage = "";

  void _startAppBuilder() {
    if (_appPromptController.text.trim().isEmpty) return;

    setState(() {
      _isBuilding = true;
      _resultMessage = "";
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        _isBuilding = false;
        _resultMessage = "تم إنشاء التطبيق المطلوب بنجاح وأصبح جاهزاً للاستخدام والمعاينة 🚀";
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم إنشاء التطبيق بنجاح 📲✨')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🛠️ منشئ التطبيقات الذكي', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('وصف التطبيق المطلوب إنشاؤه:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _appPromptController,
              maxLines: 3,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'مثال: اعمل لي تطبيق متجر إلكتروني للموبايل يحتوي على سلة تسوق ونظام دفع وتسجيل دخول...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                filled: true,
                fillColor: const Color(0xFFF8F9FA),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _isBuilding ? null : _startAppBuilder,
              icon: _isBuilding
                  ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                  : const Icon(Icons.developer_board_rounded, color: Colors.white),
              label: Text(_isBuilding ? 'جاري إنشاء التطبيق...' : 'إنشاء التطبيق الآن 🚀', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(height: 20),
            if (_resultMessage.isNotEmpty) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
                ),
                child: Text(
                  _resultMessage,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
