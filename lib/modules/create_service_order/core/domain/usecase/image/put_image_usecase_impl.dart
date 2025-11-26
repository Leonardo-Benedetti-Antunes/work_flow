import "package:injectable/injectable.dart";
import "package:work_flow/modules/create_service_order/core/domain/contract/repository/image/put_image_repository.dart";
import "package:work_flow/modules/create_service_order/core/domain/contract/usecase/image/put_image_usecase.dart";
import "package:work_flow/core/domain/model/image_model.dart";

@LazySingleton(as: PutImageUsecase)
class PutImageUsecaseImpl implements PutImageUsecase {
  final PutImageRepository putImageRepository;

  PutImageUsecaseImpl(this.putImageRepository);

  @override
  Future<void> call(ImageModel imageModel, int id) async {
    return await putImageRepository(imageModel, id);
  }
}
