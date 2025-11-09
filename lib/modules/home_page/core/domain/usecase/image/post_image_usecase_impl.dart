import 'package:injectable/injectable.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/repository/image/post_image_repository.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/image/post_image_usecase.dart';
import 'package:work_flow/modules/home_page/core/domain/model/image_model.dart';

@LazySingleton(as: PostImageUsecase)
class PostImageUsecaseImpl implements PostImageUsecase {
  final PostImageRepository postImageRepository;

  PostImageUsecaseImpl(this.postImageRepository);

  @override
  Future<void> call(ImageModel imageModel) async {
    return await postImageRepository(imageModel);
  }
}
