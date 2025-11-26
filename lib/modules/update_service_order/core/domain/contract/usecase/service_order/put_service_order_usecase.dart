import 'package:work_flow/core/domain/model/service_order_model.dart';

abstract class PutServiceOrderUsecase {
  Future<void> call(ServiceOrderModel serviceOrderModel, int id);
}
