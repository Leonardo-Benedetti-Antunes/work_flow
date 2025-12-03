import 'package:work_flow/core/domain/enum/status_enum.dart';
import 'package:work_flow/core/domain/model/image_model.dart';

class ServiceOrderModel {
  final int? id;
  final String name;
  final String? description;
  final StatusEnum status;
  final String? location;
  final DateTime? createdAt;
  final DateTime? startedAt;
  final DateTime? finishedAt;
  final List<ImageModel>? images;

  ServiceOrderModel({
    this.id,
    required this.name,
    this.description,
    required this.status,
    this.location,
    this.createdAt,
    this.startedAt,
    this.finishedAt,
    this.images = const [],
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'description': description,
    'status': status.index,
    'location': location,
    'created_at': createdAt?.toIso8601String(),
    'started_at': startedAt?.toIso8601String(),
    'finished_at': finishedAt?.toIso8601String(),
  };

  factory ServiceOrderModel.fromMap(
    Map<String, dynamic> map,
    List<ImageModel> images,
  ) {
    return ServiceOrderModel(
      id: map['id'] as int,
      name: map['name'],
      description: map['description'],
      status: StatusEnum.values[map['status'] as int],
      location: map['location'],
      createdAt: map['created_at'] as DateTime?,
      startedAt: map['started_at'] as DateTime?,
      finishedAt: map['finished_at'] as DateTime?,
      images: images,
    );
  }
}
