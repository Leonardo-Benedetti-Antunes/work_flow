import 'package:injectable/injectable.dart';
import 'package:work_flow/core/database/app_database.dart';
import 'package:work_flow/core/domain/model/image_model.dart';
import 'package:work_flow/modules/service_order_details/core/domain/contract/repository/image/get_images_repository.dart';

@LazySingleton(as: GetImagesRepository)
class GetImagesRepositoryImpl implements GetImagesRepository {
  final AppDatabase dbProvider;

  GetImagesRepositoryImpl({required this.dbProvider});

  @override
  Future<List<ImageModel>?> call(int serviceOrderId) async {
    final db = await dbProvider.database;
    final result = await db.query(
      'image',
      where: 'service_order_id = ?',
      whereArgs: [serviceOrderId],
    );

    return result.map((e) => ImageModel.fromMap(e)).toList();
  }
}
