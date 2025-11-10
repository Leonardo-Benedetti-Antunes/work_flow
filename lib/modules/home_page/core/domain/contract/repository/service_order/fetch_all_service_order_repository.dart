import 'package:work_flow/modules/home_page/core/domain/model/service_order_model.dart';

abstract class FetchAllServiceOrderRepository {
  Future<List<ServiceOrderModel>> call();
}
