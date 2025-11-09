import 'package:injectable/injectable.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/repository/image/get_image_repository.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/image/get_image_usecase.dart';
import 'package:work_flow/modules/home_page/core/domain/model/image_model.dart';

@LazySingleton(as: GetImageUsecase)
class GetImageUsecaseImpl implements GetImageUsecase {
  final GetImageRepository getImageRepository;

  GetImageUsecaseImpl(this.getImageRepository);

  @override
  Future<ImageModel> call(int id) async {
    return await getImageRepository(id);
  }
}
