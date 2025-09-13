import 'package:json_annotation/json_annotation.dart';

part 'notification_params.g.dart';

@JsonSerializable()
class NotificationParams {
  NotificationParams({
    required this.isPagingEnabled,
    required this.pageIndex,
    required this.pageSize,
    required this.sortColumn,
    required this.sortDirection,
    required this.search,
    required this.readDto,
  });

  final bool? isPagingEnabled;
  final num? pageIndex;
  final num? pageSize;
  final String? sortColumn;
  final String? sortDirection;
  final String? search;
  final ReadDto? readDto;

  NotificationParams copyWith({
    bool? isPagingEnabled,
    num? pageIndex,
    num? pageSize,
    String? sortColumn,
    String? sortDirection,
    String? search,
    ReadDto? readDto,
  }) {
    return NotificationParams(
      isPagingEnabled: isPagingEnabled ?? this.isPagingEnabled,
      pageIndex: pageIndex ?? this.pageIndex,
      pageSize: pageSize ?? this.pageSize,
      sortColumn: sortColumn ?? this.sortColumn,
      sortDirection: sortDirection ?? this.sortDirection,
      search: search ?? this.search,
      readDto: readDto ?? this.readDto,
    );
  }

  factory NotificationParams.fromJson(Map<String, dynamic> json) =>
      _$NotificationParamsFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationParamsToJson(this);

  @override
  String toString() {
    return "$isPagingEnabled, $pageIndex, $pageSize, $sortColumn, $sortDirection, $search, $readDto, ";
  }
}

@JsonSerializable()
class ReadDto {
  ReadDto({
    required this.id,
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.senderId,
    required this.senderName,
    required this.attachment,
  });

  final int? id;
  final String? title;
  final String? body;
  final String? imageUrl;
  final num? senderId;
  final String? senderName;
  final List<String>? attachment;

  ReadDto copyWith({
    int? id,
    String? title,
    String? body,
    String? imageUrl,
    num? senderId,
    String? senderName,
    List<String>? attachment,
  }) {
    return ReadDto(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      imageUrl: imageUrl ?? this.imageUrl,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      attachment: attachment ?? this.attachment,
    );
  }

  factory ReadDto.fromJson(Map<String, dynamic> json) =>
      _$ReadDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReadDtoToJson(this);

  @override
  String toString() {
    return "$id, $title, $body, $imageUrl, $senderId, $senderName, $attachment, ";
  }
}

/*
{
	"isPagingEnabled": true,
	"pageIndex": 0,
	"pageSize": 0,
	"sortColumn": "string",
	"sortDirection": "string",
	"search": "string",
	"readDto": {
		"id": 0,
		"title": "string",
		"body": "string",
		"imageUrl": "string",
		"senderId": 0,
		"senderName": "string",
		"attachment": [
			"string"
		]
	}
}*/
