class NotificationEntity {
  String? title;
  String? body;
  List<String>? attatchments;
  String? userName;
  String? userID;
  bool isRead;
  DateTime? date;

  NotificationEntity({
    this.title,
    this.body,
    this.attatchments,
    this.userName,
    this.userID,
    this.isRead = false,
    this.date,
  });

}
