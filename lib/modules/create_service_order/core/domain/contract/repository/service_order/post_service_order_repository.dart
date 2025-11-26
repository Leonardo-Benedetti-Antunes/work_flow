import 'package:work_flow/core/domain/model/service_order_model.dart';

abstract class PostServiceOrderRepository {
  Future<void> call(ServiceOrderModel serviceOrderModel);
}
