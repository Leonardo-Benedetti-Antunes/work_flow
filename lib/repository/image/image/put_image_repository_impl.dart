import 'package:injectable/injectable.dart';
import 'package:work_flow/core/database/app_database.dart';
import 'package:work_flow/core/domain/contract/repository/image/put_image_repository.dart';
import 'package:work_flow/core/domain/model/image_model.dart';

@LazySingleton(as: PutImageRepository)
class PutImageRepositoryImpl implements PutImageRepository {
  final AppDatabase dbProvider;

  PutImageRepositoryImpl({required this.dbProvider});

  @override
  Future<void> call(ImageModel imageModel, int id) async {
    final db = await dbProvider.database;
    await db.update(
      'image',
      imageModel.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
