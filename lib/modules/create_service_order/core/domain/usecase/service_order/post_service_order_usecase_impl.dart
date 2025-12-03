import 'package:injectable/injectable.dart';
import 'package:work_flow/core/domain/model/image_model.dart';
import 'package:work_flow/modules/create_service_order/core/domain/contract/repository/image/post_image_repository.dart';
import 'package:work_flow/modules/create_service_order/core/domain/contract/repository/service_order/post_service_order_repository.dart';
import 'package:work_flow/modules/create_service_order/core/domain/contract/usecase/service_order/post_service_order_usecase.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';

@LazySingleton(as: PostServiceOrderUsecase)
class PostServiceOrderUsecaseImpl implements PostServiceOrderUsecase {
  final PostServiceOrderRepository postServiceOrderRepository;
  final PostImageRepository postImageRepository;

  PostServiceOrderUsecaseImpl(
    this.postServiceOrderRepository,
    this.postImageRepository,
  );

  @override
  Future<void> call(
    ServiceOrderModel serviceOrderModel,
    List<ImageModel>? images,
  ) async {
    final int id = await postServiceOrderRepository(serviceOrderModel);

    if (images == null || images.isEmpty) {
      return;
    }
    for (final image in images) {
      await postImageRepository(
        ImageModel(
          serviceOrderId: id,
          imageUrl: image.imageUrl,
          title: image.title ?? "${DateTime.now()}",
        ),
      );
    }
  }
}
