// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationParams _$NotificationParamsFromJson(Map<String, dynamic> json) =>
    NotificationParams(
      isPagingEnabled: json['isPagingEnabled'] as bool?,
      pageIndex: json['pageIndex'] as num?,
      pageSize: json['pageSize'] as num?,
      sortColumn: json['sortColumn'] as String?,
      sortDirection: json['sortDirection'] as String?,
      search: json['search'] as String?,
      readDto: json['readDto'] == null
          ? null
          : ReadDto.fromJson(json['readDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationParamsToJson(NotificationParams instance) =>
    <String, dynamic>{
      'isPagingEnabled': instance.isPagingEnabled,
      'pageIndex': instance.pageIndex,
      'pageSize': instance.pageSize,
      'sortColumn': instance.sortColumn,
      'sortDirection': instance.sortDirection,
      'search': instance.search,
      'readDto': instance.readDto,
    };

ReadDto _$ReadDtoFromJson(Map<String, dynamic> json) => ReadDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      body: json['body'] as String?,
      imageUrl: json['imageUrl'] as String?,
      senderId: json['senderId'] as num?,
      senderName: json['senderName'] as String?,
      attachment: (json['attachment'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ReadDtoToJson(ReadDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'imageUrl': instance.imageUrl,
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'attachment': instance.attachment,
    };
