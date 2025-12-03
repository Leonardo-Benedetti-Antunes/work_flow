import 'package:injectable/injectable.dart';
import 'package:work_flow/core/database/app_database.dart';
import 'package:work_flow/core/domain/contract/repository/service_order/get_service_order_repository.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';

@LazySingleton(as: GetServiceOrderRepository)
class GetServiceOrderRepositoryImpl implements GetServiceOrderRepository {
  final AppDatabase dbProvider;

  GetServiceOrderRepositoryImpl(this.dbProvider);

  @override
  Future<ServiceOrderModel> call(int id) async {
    final db = await dbProvider.database;
    final response = await db.query(
      'service_order',
      where: 'id = ?',
      whereArgs: [id],
    );

    return ServiceOrderModel.fromMap(response.first, []);
  }
}
