import 'package:injectable/injectable.dart';
import 'package:work_flow/core/domain/model/image_model.dart';
import 'package:work_flow/core/domain/contract/repository/service_order/put_service_order_repository.dart';
import 'package:work_flow/core/domain/contract/usecase/put_service_order_usecase.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';

@LazySingleton(as: PutServiceOrderUsecase)
class PutServiceOrderUsecaseImpl implements PutServiceOrderUsecase {
  final PutServiceOrderRepository putServiceOrderRepository;

  PutServiceOrderUsecaseImpl(this.putServiceOrderRepository);

  @override
  Future<void> call(
    ServiceOrderModel serviceOrderModel,
    List<ImageModel>? images,
    int id,
  ) async {
    return await putServiceOrderRepository(serviceOrderModel, id);
  }
}
