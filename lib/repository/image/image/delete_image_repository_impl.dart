import 'package:injectable/injectable.dart';
import 'package:work_flow/core/database/app_database.dart';
import 'package:work_flow/core/domain/contract/repository/image/delete_image_repository.dart';

@LazySingleton(as: DeleteImageRepository)
class DeleteImageRepositoryImpl implements DeleteImageRepository {
  final AppDatabase dbProvider;

  DeleteImageRepositoryImpl({required this.dbProvider});

  @override
  Future<void> call(int id) async {
    final db = await dbProvider.database;
    await db.delete('image', where: 'id = ?', whereArgs: [id]);
    return;
  }
}
