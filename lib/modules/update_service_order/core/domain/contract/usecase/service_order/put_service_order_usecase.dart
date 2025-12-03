import 'package:work_flow/core/domain/model/image_model.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';

abstract class PutServiceOrderUsecase {
  Future<void> call(
    ServiceOrderModel serviceOrderModel,
    List<ImageModel>? images,
    int id,
  );
}
