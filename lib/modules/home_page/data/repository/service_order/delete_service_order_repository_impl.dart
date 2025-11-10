import 'package:injectable/injectable.dart';
import 'package:work_flow/core/database/app_database.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/repository/service_order/delete_service_order_repository.dart';

@LazySingleton(as: DeleteServiceOrderRepository)
class DeleteServiceOrderRepositoryImpl implements DeleteServiceOrderRepository {
  final AppDatabase dbProvider;

  DeleteServiceOrderRepositoryImpl({required this.dbProvider});

  @override
  Future<void> call(int id) async {
    final db = await dbProvider.database;
    await db.delete('service_order', where: 'id = ?', whereArgs: [id]);
    return;
  }
}
