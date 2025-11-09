import 'package:injectable/injectable.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/repository/service_order/get_service_order_repository.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/get_service_order_usecase.dart';
import 'package:work_flow/modules/home_page/core/domain/model/service_order_model.dart';

@LazySingleton(as: GetServiceOrderUsecase)
class GetServiceOrderUsecaseImpl implements GetServiceOrderUsecase {
  final GetServiceOrderRepository getServiceOrderRepository;

  GetServiceOrderUsecaseImpl(this.getServiceOrderRepository);

  @override
  Future<ServiceOrderModel> call(int id) async {
    return await getServiceOrderRepository(id);
  }
}
