import 'package:work_flow/modules/home_page/core/domain/model/image_model.dart';

abstract class GetImageUsecase {
  Future<ImageModel> call(int id);
}
