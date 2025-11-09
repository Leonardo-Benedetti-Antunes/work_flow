import 'package:work_flow/modules/home_page/core/domain/model/image_model.dart';

abstract class PostImageUsecase {
  Future<void> call(ImageModel imageModel);
}
