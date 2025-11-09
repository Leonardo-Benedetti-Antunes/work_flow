import 'package:injectable/injectable.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/repository/service_order/fetch_all_service_order_repository.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/fetch_all_service_order_usecase.dart';
import 'package:work_flow/modules/home_page/core/domain/model/service_order_model.dart';

@LazySingleton(as: FetchAllServiceOrderUsecase)
class FetchAllServiceOrderUsecaseImpl implements FetchAllServiceOrderUsecase {
  final FetchAllServiceOrderRepository fetchAllServiceOrderRepository;

  FetchAllServiceOrderUsecaseImpl(this.fetchAllServiceOrderRepository);

  @override
  Future<List<ServiceOrderModel>> call() async {
    return await fetchAllServiceOrderRepository();
  }
}
