

class TaskModel {
  String? title;
  String? time;
  TaskModel({this.title, this.time});
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json["title"] ?? "Untitled",
      time: json["time"] ?? "",
    );
  }
}