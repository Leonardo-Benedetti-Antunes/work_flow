import 'package:work_flow/modules/home_page/core/domain/model/service_order_model.dart';

abstract class PutServiceOrderRepository {
  Future<void> call(ServiceOrderModel serviceOrderModel, int id);
}
