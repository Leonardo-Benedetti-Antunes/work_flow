import 'package:work_flow/core/domain/model/image_model.dart';

abstract class PostImageRepository {
  Future<void> call(ImageModel imageModel);
}
