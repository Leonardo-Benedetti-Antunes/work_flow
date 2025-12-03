import 'package:work_flow/core/domain/model/service_order_model.dart';

abstract class FetchAllServiceOrderRepository {
  Future<List<ServiceOrderModel>> call();
}
