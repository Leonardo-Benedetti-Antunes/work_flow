import 'package:injectable/injectable.dart';
import 'package:work_flow/core/domain/contract/repository/image/delete_image_repository.dart';
import 'package:work_flow/core/domain/contract/repository/service_order/delete_service_order_repository.dart';
import 'package:work_flow/core/domain/contract/usecase/delete_service_order_usecase.dart';

@LazySingleton(as: DeleteServiceOrderUsecase)
class DeleteServiceOrderUsecaseImpl implements DeleteServiceOrderUsecase {
  final DeleteServiceOrderRepository deleteServiceOrderRepository;
  final DeleteImageRepository deleteImageRepository;

  DeleteServiceOrderUsecaseImpl(
    this.deleteServiceOrderRepository,
    this.deleteImageRepository,
  );

  @override
  Future<void> call(int id) async {
    await deleteImageRepository(id);
    await deleteServiceOrderRepository(id);
  }
}
