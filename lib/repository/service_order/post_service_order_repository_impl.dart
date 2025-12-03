import 'package:injectable/injectable.dart';
import 'package:work_flow/core/database/app_database.dart';
import 'package:work_flow/core/domain/contract/repository/service_order/post_service_order_repository.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';

@LazySingleton(as: PostServiceOrderRepository)
class PostServiceOrderRepositoryImpl implements PostServiceOrderRepository {
  final AppDatabase dbProvider;

  PostServiceOrderRepositoryImpl({required this.dbProvider});

  @override
  Future<int> call(ServiceOrderModel serviceOrderModel) async {
    final db = await dbProvider.database;
    final response = await db.insert(
      'service_order',
      serviceOrderModel.toMap(),
    );
    return response;
  }
}
