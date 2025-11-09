import 'package:injectable/injectable.dart';
import 'package:work_flow/core/database/app_database.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/repository/image/get_image_repository.dart';
import 'package:work_flow/modules/home_page/core/domain/model/image_model.dart';

@LazySingleton(as: GetImageRepository)
class GetImageRepositoryImpl implements GetImageRepository {
  final AppDatabase dbProvider;

  GetImageRepositoryImpl({required this.dbProvider});

  @override
  Future<ImageModel> call(int id) async {
    final db = await dbProvider.database;
    final response = await db.query('image', where: 'id = ?', whereArgs: [id]);
    return ImageModel.fromMap(response.first);
  }
}
