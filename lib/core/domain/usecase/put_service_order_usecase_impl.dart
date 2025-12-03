import 'package:injectable/injectable.dart';
import 'package:work_flow/core/domain/contract/repository/image/delete_image_repository.dart';
import 'package:work_flow/core/domain/contract/repository/image/post_image_repository.dart';
import 'package:work_flow/core/domain/model/image_model.dart';
import 'package:work_flow/core/domain/contract/repository/service_order/put_service_order_repository.dart';
import 'package:work_flow/core/domain/contract/usecase/put_service_order_usecase.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';

@LazySingleton(as: PutServiceOrderUsecase)
class PutServiceOrderUsecaseImpl implements PutServiceOrderUsecase {
  final PutServiceOrderRepository putServiceOrderRepository;
  final DeleteImageRepository deleteImageRepository;
  final PostImageRepository postImageRepository;

  PutServiceOrderUsecaseImpl(
    this.putServiceOrderRepository,
    this.deleteImageRepository,
    this.postImageRepository,
  );

  @override
  Future<void> call(
    ServiceOrderModel serviceOrderModel,
    List<ImageModel>? images,
    int id,
  ) async {
    final response = await putServiceOrderRepository(serviceOrderModel, id);
    await deleteImageRepository(id);
    if (images == null) return response;
    for (final image in images) {
      postImageRepository(
        ImageModel(
          serviceOrderId: serviceOrderModel.id!,
          imageUrl: image.imageUrl,
          title: DateTime.now().toString(),
        ),
      );
    }
    return response;
  }
}
