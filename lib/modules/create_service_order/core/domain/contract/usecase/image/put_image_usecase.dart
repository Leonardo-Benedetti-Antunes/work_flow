import 'package:work_flow/core/domain/model/image_model.dart';

abstract class PutImageUsecase {
  Future<void> call(ImageModel imageModel, int id);
}
