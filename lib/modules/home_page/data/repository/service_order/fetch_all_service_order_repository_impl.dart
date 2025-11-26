import 'package:injectable/injectable.dart';
import 'package:work_flow/core/database/app_database.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/repository/service_order/fetch_all_service_order_repository.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';

@LazySingleton(as: FetchAllServiceOrderRepository)
class FetchAllServiceOrderRepositoryImpl
    implements FetchAllServiceOrderRepository {
  final AppDatabase dbProvider;

  FetchAllServiceOrderRepositoryImpl({required this.dbProvider});

  @override
  Future<List<ServiceOrderModel>> call() async {
    final db = await dbProvider.database;
    final result = await db.query('service_order');
    return result.map((e) => ServiceOrderModel.fromMap(e, [])).toList();
  }
}
