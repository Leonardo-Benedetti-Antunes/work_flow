import 'package:work_flow/core/domain/model/image_model.dart';

abstract class PostImageUsecase {
  Future<void> call(ImageModel imageModel);
}
