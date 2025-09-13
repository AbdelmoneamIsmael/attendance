import 'package:attendance/features/notification/domain/entities/notification_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_response_model.g.dart';

@JsonSerializable()
class NotificationResponseModel {
  NotificationResponseModel({
    required this.pageIndex,
    required this.pageSize,
    required this.count,
    required this.pagesCount,
    required this.itemsCount,
    required this.hasPreviousPage,
    required this.hasNextPage,
    required this.data,
  });

  final num? pageIndex;
  final num? pageSize;
  final num? count;
  final num? pagesCount;
  final num? itemsCount;
  final bool? hasPreviousPage;
  final bool? hasNextPage;
  final List<AppNotificationModel>? data;

  NotificationResponseModel copyWith({
    num? pageIndex,
    num? pageSize,
    num? count,
    num? pagesCount,
    num? itemsCount,
    bool? hasPreviousPage,
    bool? hasNextPage,
    List<AppNotificationModel>? data,
  }) {
    return NotificationResponseModel(
      pageIndex: pageIndex ?? this.pageIndex,
      pageSize: pageSize ?? this.pageSize,
      count: count ?? this.count,
      pagesCount: pagesCount ?? this.pagesCount,
      itemsCount: itemsCount ?? this.itemsCount,
      hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      data: data ?? this.data,
    );
  }

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseModelToJson(this);

  @override
  String toString() {
    return "$pageIndex, $pageSize, $count, $pagesCount, $itemsCount, $hasPreviousPage, $hasNextPage, $data, ";
  }
}

@JsonSerializable()
class AppNotificationModel extends NotificationEntity {
  AppNotificationModel({

    required super.id,
    required super.isRead,
    required super.createDate,
    required super.title,
    required super.body,
    required this.imageUrl,
    required super.senderId,
    required super.senderName,
    required super.attachment,
  }) ;

  final String? imageUrl;

  

  AppNotificationModel copyWith({
    int? id,
    String? title,
    String? body,
    String? imageUrl,
    num? senderId,
    String? senderName,
    List<String>? attachment,
    DateTime? createDate,
    bool? isRead
  }) {
    return AppNotificationModel(
      isRead: isRead ?? this.isRead,
      createDate:  createDate ?? this.createDate,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      imageUrl: imageUrl ?? this.imageUrl,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      attachment: attachment ?? this.attachment,
    );
  }

  factory AppNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppNotificationModelToJson(this);

  @override
  String toString() {
    return "$id, $title, $body, $imageUrl, $senderId, $senderName, $attachment, ";
  }
}

/*
{
	"pageIndex": 1,
	"pageSize": 10,
	"count": 8,
	"pagesCount": 1,
	"itemsCount": 8,
	"hasPreviousPage": false,
	"hasNextPage": false,
	"data": [
		{
			"id": 12,
			"title": "العنوان",
			"body": "Notifications/Create",
			"imageUrl": "/images/Notifications/eaa561f4-9f1b-4388-bada-da7906112f600deaddc4-5ddd-46d9-b42c-5c5788bc7136.jpg",
			"senderId": 1,
			"senderName": "Admin",
			"attachment": [
				"/images/Notifications/eaa561f4-9f1b-4388-bada-da7906112f600deaddc4-5ddd-46d9-b42c-5c5788bc7136.jpg",
				"/images/Notifications/f8682db0-162a-4bb1-9599-29722e404afd01b816f6-110c-45e8-96f6-b75fd7f7a1ab.jpg"
			]
		},
		{
			"id": 11,
			"title": "العنوان",
			"body": "Notifications/Create",
			"imageUrl": "/images/Notifications/eaa561f4-9f1b-4388-bada-da7906112f600deaddc4-5ddd-46d9-b42c-5c5788bc7136.jpg",
			"senderId": 1,
			"senderName": "Admin",
			"attachment": []
		},
		{
			"id": 10,
			"title": "العنوان",
			"body": "Notifications/Create",
			"imageUrl": "/images/Notifications/eaa561f4-9f1b-4388-bada-da7906112f600deaddc4-5ddd-46d9-b42c-5c5788bc7136.jpg",
			"senderId": 1,
			"senderName": "Admin",
			"attachment": []
		},
		{
			"id": 9,
			"title": "العنوان",
			"body": "Notifications/Create",
			"imageUrl": "/images/Notifications/eaa561f4-9f1b-4388-bada-da7906112f600deaddc4-5ddd-46d9-b42c-5c5788bc7136.jpg",
			"senderId": 1,
			"senderName": "Admin",
			"attachment": []
		},
		{
			"id": 8,
			"title": "العنوان",
			"body": "المحتوي",
			"imageUrl": "/images/Notifications/aaf8983b-550a-47b6-b941-09a0273c163461845394.jpg",
			"senderId": 1,
			"senderName": "Admin",
			"attachment": []
		},
		{
			"id": 7,
			"title": "العنوان",
			"body": "المحتوي",
			"imageUrl": "/images/Notifications/aaf8983b-550a-47b6-b941-09a0273c163461845394.jpg",
			"senderId": 1,
			"senderName": "Admin",
			"attachment": []
		},
		{
			"id": 6,
			"title": "العنوان",
			"body": "asd",
			"imageUrl": "a",
			"senderId": 1,
			"senderName": "Admin",
			"attachment": []
		},
		{
			"id": 5,
			"title": "العنوان",
			"body": "المحتوي",
			"imageUrl": "a",
			"senderId": 1,
			"senderName": "Admin",
			"attachment": []
		}
	]
}*/
