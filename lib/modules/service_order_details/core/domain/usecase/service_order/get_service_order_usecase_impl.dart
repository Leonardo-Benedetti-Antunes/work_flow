import 'package:injectable/injectable.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';
import 'package:work_flow/modules/service_order_details/core/domain/contract/repository/service_order/get_service_order_repository.dart';
import 'package:work_flow/modules/service_order_details/core/domain/contract/usecase/service_order/get_service_order_usecase.dart';
import 'package:work_flow/modules/service_order_details/data/repository/image/get_images_repository_impl.dart';

@LazySingleton(as: GetServiceOrderUsecase)
class GetServiceOrderUsecaseImpl implements GetServiceOrderUsecase {
  final GetServiceOrderRepository getServiceOrderRepository;
  final GetImagesRepositoryImpl getImagesRepository;

  GetServiceOrderUsecaseImpl(
    this.getServiceOrderRepository,
    this.getImagesRepository,
  );

  @override
  Future<ServiceOrderModel> call(int id) async {
    final serviceOrder = await getServiceOrderRepository(id);
    final images = await getImagesRepository(id);

    if (images == null) return serviceOrder;

    for (final image in images) {
      serviceOrder.images?.add(image);
    }

    return serviceOrder;
  }
}
