import 'package:work_flow/core/domain/model/image_model.dart';

abstract class GetImageRepository {
  Future<ImageModel> call(int id);
}
