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
import 'package:work_flow/modules/create_service_order/controller/add_service_order_controller.dart'
    as _i1066;
import 'package:work_flow/modules/create_service_order/core/domain/contract/repository/image/delete_image_repository.dart'
    as _i137;
import 'package:work_flow/modules/create_service_order/core/domain/contract/repository/image/post_image_repository.dart'
    as _i1029;
import 'package:work_flow/modules/create_service_order/core/domain/contract/repository/image/put_image_repository.dart'
    as _i679;
import 'package:work_flow/modules/create_service_order/core/domain/contract/repository/service_order/post_service_order_repository.dart'
    as _i725;
import 'package:work_flow/modules/create_service_order/core/domain/contract/usecase/service_order/post_service_order_usecase.dart'
    as _i1004;
import 'package:work_flow/modules/create_service_order/core/domain/usecase/service_order/post_service_order_usecase_impl.dart'
    as _i91;
import 'package:work_flow/modules/create_service_order/data/repository/image/delete_image_repository_impl.dart'
    as _i556;
import 'package:work_flow/modules/create_service_order/data/repository/image/post_image_repository_impl.dart'
    as _i408;
import 'package:work_flow/modules/create_service_order/data/repository/image/put_image_repository_impl.dart'
    as _i332;
import 'package:work_flow/modules/create_service_order/data/repository/service_order/post_service_order_repository_impl.dart'
    as _i20;
import 'package:work_flow/modules/home_page/controller/home_page_controller.dart'
    as _i566;
import 'package:work_flow/modules/home_page/core/domain/contract/repository/service_order/delete_service_order_repository.dart'
    as _i653;
import 'package:work_flow/modules/home_page/core/domain/contract/repository/service_order/fetch_all_service_order_repository.dart'
    as _i963;
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/delete_service_order_usecase.dart'
    as _i842;
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/fetch_all_service_order_usecase.dart'
    as _i46;
import 'package:work_flow/modules/home_page/core/domain/usecase/service_order/delete_service_order_usecase_impl.dart'
    as _i114;
import 'package:work_flow/modules/home_page/core/domain/usecase/service_order/fetch_all_service_order_usecase_impl.dart'
    as _i500;
import 'package:work_flow/modules/home_page/data/repository/service_order/delete_service_order_repository_impl.dart'
    as _i499;
import 'package:work_flow/modules/home_page/data/repository/service_order/fetch_all_service_order_repository_impl.dart'
    as _i159;
import 'package:work_flow/modules/service_order_details/controller/service_order_details_controller.dart'
    as _i735;
import 'package:work_flow/modules/service_order_details/core/domain/contract/repository/image/get_images_repository.dart'
    as _i510;
import 'package:work_flow/modules/service_order_details/core/domain/contract/repository/service_order/get_service_order_repository.dart'
    as _i317;
import 'package:work_flow/modules/service_order_details/core/domain/contract/usecase/service_order/get_service_order_usecase.dart'
    as _i775;
import 'package:work_flow/modules/service_order_details/core/domain/usecase/service_order/get_service_order_usecase_impl.dart'
    as _i1057;
import 'package:work_flow/modules/service_order_details/data/repository/image/get_images_repository_impl.dart'
    as _i361;
import 'package:work_flow/modules/service_order_details/data/repository/service_order/get_service_order_repository_impl.dart'
    as _i499;
import 'package:work_flow/modules/update_service_order/controller/edit_service_order_controller.dart'
    as _i842;
import 'package:work_flow/modules/update_service_order/core/domain/contract/repository/service_order/put_service_order_repository.dart'
    as _i866;
import 'package:work_flow/modules/update_service_order/core/domain/contract/usecase/service_order/put_service_order_usecase.dart'
    as _i315;
import 'package:work_flow/modules/update_service_order/core/domain/usecase/service_order/put_service_order_usecase_impl.dart'
    as _i960;
import 'package:work_flow/modules/update_service_order/data/repository/service_order/put_service_order_repository_impl.dart'
    as _i370;

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
    gh.lazySingleton<_i866.PutServiceOrderRepository>(
      () => _i370.PutServiceOrderRepositoryImpl(
        dbProvider: gh<_i657.AppDatabase>(),
      ),
    );
    gh.lazySingleton<_i963.FetchAllServiceOrderRepository>(
      () => _i159.FetchAllServiceOrderRepositoryImpl(
        dbProvider: gh<_i657.AppDatabase>(),
      ),
    );
    gh.lazySingleton<_i1029.PostImageRepository>(
      () => _i408.PostImageRepositoryImpl(dbProvider: gh<_i657.AppDatabase>()),
    );
    gh.lazySingleton<_i510.GetImagesRepository>(
      () => _i361.GetImagesRepositoryImpl(dbProvider: gh<_i657.AppDatabase>()),
    );
    gh.lazySingleton<_i725.PostServiceOrderRepository>(
      () => _i20.PostServiceOrderRepositoryImpl(
        dbProvider: gh<_i657.AppDatabase>(),
      ),
    );
    gh.lazySingleton<_i679.PutImageRepository>(
      () => _i332.PutImageRepositoryImpl(dbProvider: gh<_i657.AppDatabase>()),
    );
    gh.lazySingleton<_i137.DeleteImageRepository>(
      () =>
          _i556.DeleteImageRepositoryImpl(dbProvider: gh<_i657.AppDatabase>()),
    );
    gh.lazySingleton<_i842.DeleteServiceOrderUsecase>(
      () => _i114.DeleteServiceOrderUsecaseImpl(
        gh<_i653.DeleteServiceOrderRepository>(),
      ),
    );
    gh.lazySingleton<_i317.GetServiceOrderRepository>(
      () => _i499.GetServiceOrderRepositoryImpl(gh<_i657.AppDatabase>()),
    );
    gh.lazySingleton<_i1004.PostServiceOrderUsecase>(
      () => _i91.PostServiceOrderUsecaseImpl(
        gh<_i725.PostServiceOrderRepository>(),
        gh<_i1029.PostImageRepository>(),
      ),
    );
    gh.lazySingleton<_i315.PutServiceOrderUsecase>(
      () => _i960.PutServiceOrderUsecaseImpl(
        gh<_i866.PutServiceOrderRepository>(),
      ),
    );
    gh.lazySingleton<_i46.FetchAllServiceOrderUsecase>(
      () => _i500.FetchAllServiceOrderUsecaseImpl(
        gh<_i963.FetchAllServiceOrderRepository>(),
      ),
    );
    gh.factory<_i1066.AddServiceOrderController>(
      () => _i1066.AddServiceOrderController(
        gh<_i1004.PostServiceOrderUsecase>(),
      ),
    );
    gh.lazySingleton<_i775.GetServiceOrderUsecase>(
      () => _i1057.GetServiceOrderUsecaseImpl(
        gh<_i317.GetServiceOrderRepository>(),
        gh<_i361.GetImagesRepositoryImpl>(),
      ),
    );
    gh.factory<_i566.HomePageController>(
      () => _i566.HomePageController(
        deleteServiceOrderUsecase: gh<_i842.DeleteServiceOrderUsecase>(),
        fetchAllServiceOrderUsecase: gh<_i46.FetchAllServiceOrderUsecase>(),
        postServiceOrderUsecase: gh<_i1004.PostServiceOrderUsecase>(),
        putServiceOrderUsecase: gh<_i315.PutServiceOrderUsecase>(),
      ),
    );
    gh.factory<_i842.EditServiceOrderController>(
      () =>
          _i842.EditServiceOrderController(gh<_i315.PutServiceOrderUsecase>()),
    );
    gh.factoryParam<_i735.ServiceOrderDetailsController, int, dynamic>(
      (serviceOrderId, _) => _i735.ServiceOrderDetailsController(
        gh<_i775.GetServiceOrderUsecase>(),
        serviceOrderId,
      ),
    );
    return this;
  }
}
