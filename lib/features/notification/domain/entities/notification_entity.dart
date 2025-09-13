class NotificationEntity {
  String? title;
  String? body;
  List<String>? attachment;
  String? senderName;
  num? senderId;
  bool isRead;
  DateTime? createDate;
  num? id;

  NotificationEntity({
    this.title,
    this.body,
    this.attachment,
    this.senderName,
    this.senderId,
    this.isRead = false,
    this.createDate,
    this.id
  });

}
