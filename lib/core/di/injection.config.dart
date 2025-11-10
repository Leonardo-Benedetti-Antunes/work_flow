// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:work_flow/core/database/app_database.dart' as _i657;
import 'package:work_flow/modules/home_page/controller/home_page_controller.dart'
    as _i566;
import 'package:work_flow/modules/home_page/core/domain/contract/repository/image/delete_image_repository.dart'
    as _i853;
import 'package:work_flow/modules/home_page/core/domain/contract/repository/image/get_image_repository.dart'
    as _i512;
import 'package:work_flow/modules/home_page/core/domain/contract/repository/image/post_image_repository.dart'
    as _i744;
import 'package:work_flow/modules/home_page/core/domain/contract/repository/image/put_image_repository.dart'
    as _i702;
import 'package:work_flow/modules/home_page/core/domain/contract/repository/service_order/delete_service_order_repository.dart'
    as _i653;
import 'package:work_flow/modules/home_page/core/domain/contract/repository/service_order/fetch_all_service_order_repository.dart'
    as _i963;
import 'package:work_flow/modules/home_page/core/domain/contract/repository/service_order/get_service_order_repository.dart'
    as _i121;
import 'package:work_flow/modules/home_page/core/domain/contract/repository/service_order/post_service_order_repository.dart'
    as _i70;
import 'package:work_flow/modules/home_page/core/domain/contract/repository/service_order/put_service_order_repository.dart'
    as _i418;
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/image/delete_image_usecase.dart'
    as _i493;
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/image/get_image_usecase.dart'
    as _i996;
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/image/post_image_usecase.dart'
    as _i1069;
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/image/put_image_usecase.dart'
    as _i1006;
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/delete_service_order_usecase.dart'
    as _i842;
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/fetch_all_service_order_usecase.dart'
    as _i46;
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/get_service_order_usecase.dart'
    as _i863;
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/post_service_order_usecase.dart'
    as _i123;
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/put_service_order_usecase.dart'
    as _i222;
import 'package:work_flow/modules/home_page/core/domain/usecase/image/delete_image_usecase_impl.dart'
    as _i732;
import 'package:work_flow/modules/home_page/core/domain/usecase/image/get_image_usecase_impl.dart'
    as _i643;
import 'package:work_flow/modules/home_page/core/domain/usecase/image/post_image_usecase_impl.dart'
    as _i174;
import 'package:work_flow/modules/home_page/core/domain/usecase/image/put_image_usecase_impl.dart'
    as _i844;
import 'package:work_flow/modules/home_page/core/domain/usecase/service_order/delete_service_order_usecase_impl.dart'
    as _i114;
import 'package:work_flow/modules/home_page/core/domain/usecase/service_order/fetch_all_service_order_usecase_impl.dart'
    as _i500;
import 'package:work_flow/modules/home_page/core/domain/usecase/service_order/get_service_order_usecase_impl.dart'
    as _i55;
import 'package:work_flow/modules/home_page/core/domain/usecase/service_order/post_service_order_usecase_impl.dart'
    as _i912;
import 'package:work_flow/modules/home_page/core/domain/usecase/service_order/put_service_order_usecase_impl.dart'
    as _i166;
import 'package:work_flow/modules/home_page/data/repository/image/delete_image_repository_impl.dart'
    as _i595;
import 'package:work_flow/modules/home_page/data/repository/image/get_image_repository_impl.dart'
    as _i412;
import 'package:work_flow/modules/home_page/data/repository/image/post_image_repository_impl.dart'
    as _i491;
import 'package:work_flow/modules/home_page/data/repository/image/put_image_repository_impl.dart'
    as _i110;
import 'package:work_flow/modules/home_page/data/repository/service_order/delete_service_order_repository_impl.dart'
    as _i499;
import 'package:work_flow/modules/home_page/data/repository/service_order/fetch_all_service_order_repository_impl.dart'
    as _i159;
import 'package:work_flow/modules/home_page/data/repository/service_order/get_service_order_repository_impl.dart'
    as _i654;
import 'package:work_flow/modules/home_page/data/repository/service_order/post_service_order_repository_impl.dart'
    as _i391;
import 'package:work_flow/modules/home_page/data/repository/service_order/put_service_order_repository_impl.dart'
    as _i964;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i657.AppDatabase>(() => _i657.AppDatabase());
    gh.lazySingleton<_i653.DeleteServiceOrderRepository>(
      () => _i499.DeleteServiceOrderRepositoryImpl(
        dbProvider: gh<_i657.AppDatabase>(),
      ),
    );
    gh.lazySingleton<_i963.FetchAllServiceOrderRepository>(
      () => _i159.FetchAllServiceOrderRepositoryImpl(
        dbProvider: gh<_i657.AppDatabase>(),
      ),
    );
    gh.lazySingleton<_i853.DeleteImageRepository>(
      () =>
          _i595.DeleteImageRepositoryImpl(dbProvider: gh<_i657.AppDatabase>()),
    );
    gh.lazySingleton<_i512.GetImageRepository>(
      () => _i412.GetImageRepositoryImpl(dbProvider: gh<_i657.AppDatabase>()),
    );
    gh.lazySingleton<_i996.GetImageUsecase>(
      () => _i643.GetImageUsecaseImpl(gh<_i512.GetImageRepository>()),
    );
    gh.lazySingleton<_i70.PostServiceOrderRepository>(
      () => _i391.PostServiceOrderRepositoryImpl(
        dbProvider: gh<_i657.AppDatabase>(),
      ),
    );
    gh.lazySingleton<_i418.PutServiceOrderRepository>(
      () => _i964.PutServiceOrderRepositoryImpl(
        dbProvider: gh<_i657.AppDatabase>(),
      ),
    );
    gh.lazySingleton<_i123.PostServiceOrderUsecase>(
      () => _i912.PostServiceOrderUsecaseImpl(
        gh<_i70.PostServiceOrderRepository>(),
      ),
    );
    gh.lazySingleton<_i744.PostImageRepository>(
      () => _i491.PostImageRepositoryImpl(dbProvider: gh<_i657.AppDatabase>()),
    );
    gh.lazySingleton<_i842.DeleteServiceOrderUsecase>(
      () => _i114.DeleteServiceOrderUsecaseImpl(
        gh<_i653.DeleteServiceOrderRepository>(),
      ),
    );
    gh.lazySingleton<_i121.GetServiceOrderRepository>(
      () => _i654.GetServiceOrderRepositoryImpl(
        dbProvider: gh<_i657.AppDatabase>(),
      ),
    );
    gh.lazySingleton<_i702.PutImageRepository>(
      () => _i110.PutImageRepositoryImpl(dbProvider: gh<_i657.AppDatabase>()),
    );
    gh.lazySingleton<_i222.PutServiceOrderUsecase>(
      () => _i166.PutServiceOrderUsecaseImpl(
        gh<_i418.PutServiceOrderRepository>(),
      ),
    );
    gh.lazySingleton<_i46.FetchAllServiceOrderUsecase>(
      () => _i500.FetchAllServiceOrderUsecaseImpl(
        gh<_i963.FetchAllServiceOrderRepository>(),
      ),
    );
    gh.lazySingleton<_i1069.PostImageUsecase>(
      () => _i174.PostImageUsecaseImpl(gh<_i744.PostImageRepository>()),
    );
    gh.lazySingleton<_i1006.PutImageUsecase>(
      () => _i844.PutImageUsecaseImpl(gh<_i702.PutImageRepository>()),
    );
    gh.lazySingleton<_i493.DeleteImageUsecase>(
      () => _i732.DeleteImageUsecaseImpl(gh<_i853.DeleteImageRepository>()),
    );
    gh.lazySingleton<_i863.GetServiceOrderUsecase>(
      () => _i55.GetServiceOrderUsecaseImpl(
        gh<_i121.GetServiceOrderRepository>(),
      ),
    );
    gh.factory<_i566.HomePageController>(
      () => _i566.HomePageController(
        deleteServiceOrderUsecase: gh<_i842.DeleteServiceOrderUsecase>(),
        fetchAllServiceOrderUsecase: gh<_i46.FetchAllServiceOrderUsecase>(),
        getServiceOrderUsecase: gh<_i863.GetServiceOrderUsecase>(),
        postServiceOrderUsecase: gh<_i123.PostServiceOrderUsecase>(),
        putServiceOrderUsecase: gh<_i222.PutServiceOrderUsecase>(),
      ),
    );
    return this;
  }
}
