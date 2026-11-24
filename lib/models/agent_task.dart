// نموذج المهمة المنفذة بواسطة الوكلاء
class AgentTask {
  final String id;
  final String title;
  final String agentName;
  final String agentIcon;
  double progress;
  String status;
  String result;

  AgentTask({
    required this.id,
    required this.title,
    required this.agentName,
    required this.agentIcon,
    this.progress = 0.0,
    this.status = "قيد الانتظار",
    this.result = "",
  });
}
