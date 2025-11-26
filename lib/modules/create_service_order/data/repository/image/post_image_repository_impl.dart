import 'package:injectable/injectable.dart';
import 'package:work_flow/core/database/app_database.dart';
import 'package:work_flow/modules/create_service_order/core/domain/contract/repository/image/post_image_repository.dart';
import 'package:work_flow/core/domain/model/image_model.dart';

@LazySingleton(as: PostImageRepository)
class PostImageRepositoryImpl implements PostImageRepository {
  final AppDatabase dbProvider;

  PostImageRepositoryImpl({required this.dbProvider});

  @override
  Future<void> call(ImageModel imageModel) async {
    final db = await dbProvider.database;
    await db.insert('image', imageModel.toMap());
    return;
  }
}
