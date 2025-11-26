import 'package:injectable/injectable.dart';
import 'package:work_flow/modules/create_service_order/core/domain/contract/repository/image/delete_image_repository.dart';
import 'package:work_flow/modules/create_service_order/core/domain/contract/usecase/image/delete_image_usecase.dart';

@LazySingleton(as: DeleteImageUsecase)
class DeleteImageUsecaseImpl implements DeleteImageUsecase {
  final DeleteImageRepository deleteImageRepository;

  DeleteImageUsecaseImpl(this.deleteImageRepository);

  @override
  Future<void> call(int id) async {
    return await deleteImageRepository(id);
  }
}
