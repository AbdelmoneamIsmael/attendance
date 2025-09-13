// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponseModel _$NotificationResponseModelFromJson(
        Map<String, dynamic> json) =>
    NotificationResponseModel(
      pageIndex: json['pageIndex'] as num?,
      pageSize: json['pageSize'] as num?,
      count: json['count'] as num?,
      pagesCount: json['pagesCount'] as num?,
      itemsCount: json['itemsCount'] as num?,
      hasPreviousPage: json['hasPreviousPage'] as bool?,
      hasNextPage: json['hasNextPage'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AppNotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationResponseModelToJson(
        NotificationResponseModel instance) =>
    <String, dynamic>{
      'pageIndex': instance.pageIndex,
      'pageSize': instance.pageSize,
      'count': instance.count,
      'pagesCount': instance.pagesCount,
      'itemsCount': instance.itemsCount,
      'hasPreviousPage': instance.hasPreviousPage,
      'hasNextPage': instance.hasNextPage,
      'data': instance.data,
    };

AppNotificationModel _$AppNotificationModelFromJson(
        Map<String, dynamic> json) =>
    AppNotificationModel(
      id: json['id'] as num?,
      isRead: json['isRead'] as bool,
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      title: json['title'] as String?,
      body: json['body'] as String?,
      imageUrl: json['imageUrl'] as String?,
      senderId: json['senderId'] as num?,
      senderName: json['senderName'] as String?,
      attachment: (json['attachment'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AppNotificationModelToJson(
        AppNotificationModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'attachment': instance.attachment,
      'senderName': instance.senderName,
      'senderId': instance.senderId,
      'isRead': instance.isRead,
      'createDate': instance.createDate?.toIso8601String(),
      'id': instance.id,
      'imageUrl': instance.imageUrl,
    };
