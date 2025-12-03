import 'package:work_flow/core/domain/model/image_model.dart';

abstract class GetImagesRepository {
  Future<List<ImageModel>?> call(int serviceOrderId);
}
