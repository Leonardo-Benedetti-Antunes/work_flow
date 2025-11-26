import 'package:work_flow/core/domain/model/image_model.dart';

abstract class GetImageUsecase {
  Future<ImageModel> call(int id);
}
