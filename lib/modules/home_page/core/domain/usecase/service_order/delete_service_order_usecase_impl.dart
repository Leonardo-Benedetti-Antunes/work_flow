import 'package:injectable/injectable.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/repository/service_order/delete_service_order_repository.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/delete_service_order_usecase.dart';

@LazySingleton(as: DeleteServiceOrderUsecase)
class DeleteServiceOrderUsecaseImpl implements DeleteServiceOrderUsecase {
  final DeleteServiceOrderRepository deleteServiceOrderRepository;

  DeleteServiceOrderUsecaseImpl(this.deleteServiceOrderRepository);

  @override
  Future<void> call(int id) async {
    return await deleteServiceOrderRepository(id);
  }
}
