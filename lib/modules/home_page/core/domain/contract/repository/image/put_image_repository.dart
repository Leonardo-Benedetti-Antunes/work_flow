import 'package:work_flow/modules/home_page/core/domain/model/image_model.dart';

abstract class PutImageRepository {
  Future<void> call(ImageModel imageModel, int id);
}
