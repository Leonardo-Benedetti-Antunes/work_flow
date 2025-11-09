import 'package:injectable/injectable.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/repository/service_order/post_service_order_repository.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/post_service_order_usecase.dart';
import 'package:work_flow/modules/home_page/core/domain/model/service_order_model.dart';

@LazySingleton(as: PostServiceOrderUsecase)
class PostServiceOrderUsecaseImpl implements PostServiceOrderUsecase {
  final PostServiceOrderRepository postServiceOrderRepository;

  PostServiceOrderUsecaseImpl(this.postServiceOrderRepository);

  @override
  Future<void> call(ServiceOrderModel serviceOrderModel) async {
    return await postServiceOrderRepository(serviceOrderModel);
  }
}
