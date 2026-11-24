import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import '../../models/ai_agent.dart';

// لوحة متابعة الوكلاء المتعددين والمهام في الوقت الحقيقي (Multi-Agent Dashboard)
class AgentDashboardScreen extends StatelessWidget {
  const AgentDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AIAgent> agents = [
      AIAgent(id: "a1", name: "وكيل المدير (Orchestrator)", role: AgentRole.manager, icon: "🧠", description: "تنسيق ومراقبة عمل جميع الوكلاء", progress: 1.0, status: "نشط 🟢"),
      AIAgent(id: "a2", name: "وكيل البحث (Search Agent)", role: AgentRole.search, icon: "🔍", description: "البحث وقراءة المصادر الموثوقة", progress: 0.85, status: "جاري البحث ⚡"),
      AIAgent(id: "a3", name: "وكيل البرمجة (Coding Agent)", role: AgentRole.coding, icon: "💻", description: "كتابة وفحص واختبار الأكواد", progress: 0.70, status: "جاري البناء 🛠️"),
      AIAgent(id: "a4", name: "وكيل التصميم (Design Agent)", role: AgentRole.design, icon: "🎨", description: "إنشاء تصميمات UI/UX والبصرية", progress: 0.90, status: "شبه مكتمل ✨"),
      AIAgent(id: "a5", name: "وكيل البيانات (Data Agent)", role: AgentRole.data, icon: "📊", description: "تحليل ملفات Excel و CSV و JSON", progress: 0.60, status: "قيد التحليل 📈"),
      AIAgent(id: "a6", name: "وكيل الأمان والاختبار (Security & QA)", role: AgentRole.security, icon: "🛡️", description: "فحص الثغرات واختبار التطبيق ذاتياً", progress: 0.50, status: "جاري الفحص 🔍"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('🤖 لوحة الوكلاء المتعددين', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: AppColors.primary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: agents.length,
        itemBuilder: (context, index) {
          final agent = agents[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(agent.icon, style: const TextStyle(fontSize: 24)),
                          const SizedBox(width: 10),
                          Text(agent.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(agent.status, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(agent.description, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: agent.progress,
                            minHeight: 8,
                            backgroundColor: Colors.grey[200],
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text('${(agent.progress * 100).toInt()}%', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
