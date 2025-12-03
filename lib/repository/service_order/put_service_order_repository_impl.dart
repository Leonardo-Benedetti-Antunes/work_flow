import 'package:injectable/injectable.dart';
import 'package:work_flow/core/database/app_database.dart';
import 'package:work_flow/core/domain/contract/repository/service_order/put_service_order_repository.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';

@LazySingleton(as: PutServiceOrderRepository)
class PutServiceOrderRepositoryImpl implements PutServiceOrderRepository {
  final AppDatabase dbProvider;

  PutServiceOrderRepositoryImpl({required this.dbProvider});

  @override
  Future<void> call(ServiceOrderModel serviceOrderModel, int id) async {
    final db = await dbProvider.database;
    await db.update(
      'service_order',
      serviceOrderModel.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
    return;
  }
}
