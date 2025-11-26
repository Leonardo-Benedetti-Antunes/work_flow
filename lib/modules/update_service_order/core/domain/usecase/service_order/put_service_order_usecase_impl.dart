import 'package:injectable/injectable.dart';
import 'package:work_flow/modules/update_service_order/core/domain/contract/repository/service_order/put_service_order_repository.dart';
import 'package:work_flow/modules/update_service_order/core/domain/contract/usecase/service_order/put_service_order_usecase.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';

@LazySingleton(as: PutServiceOrderUsecase)
class PutServiceOrderUsecaseImpl implements PutServiceOrderUsecase {
  final PutServiceOrderRepository putServiceOrderRepository;

  PutServiceOrderUsecaseImpl(this.putServiceOrderRepository);

  @override
  Future<void> call(ServiceOrderModel serviceOrderModel, int id) async {
    return await putServiceOrderRepository(serviceOrderModel, id);
  }
}
