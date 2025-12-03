import 'package:injectable/injectable.dart';
import 'package:work_flow/core/domain/contract/repository/image/get_images_repository.dart';
import 'package:work_flow/core/domain/contract/repository/service_order/get_service_order_repository.dart';
import 'package:work_flow/core/domain/contract/usecase/get_service_order_usecase.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';

@LazySingleton(as: GetServiceOrderUsecase)
class GetServiceOrderUsecaseImpl implements GetServiceOrderUsecase {
  final GetServiceOrderRepository getServiceOrderRepository;
  final GetImagesRepository getImagesRepository;

  GetServiceOrderUsecaseImpl(
    this.getServiceOrderRepository,
    this.getImagesRepository,
  );
  @override
  Future<ServiceOrderModel> call(int id) async {
    final serviceOrder = await getServiceOrderRepository(id);
    final images = await getImagesRepository(id);

    if (images != null) {
      for (final image in images) {
        serviceOrder.images?.add(image);
      }
    }
    return serviceOrder;
  }
}
