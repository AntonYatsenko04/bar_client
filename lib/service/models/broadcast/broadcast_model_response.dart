import 'package:json_annotation/json_annotation.dart';

part 'broadcast_model_response.g.dart';

@JsonSerializable()
class BroadcastModelResponse {
  final int id;
  final String name;
  @JsonKey(name: 'datetime')
  final DateTime dateTime;
  final String? imageUrl;

  const BroadcastModelResponse({
    required this.id,
    required this.name,
    required this.dateTime,
    required this.imageUrl,
  });

  factory BroadcastModelResponse.fromJson(Map<String, dynamic> json) =>
      _$BroadcastModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BroadcastModelResponseToJson(this);
}
