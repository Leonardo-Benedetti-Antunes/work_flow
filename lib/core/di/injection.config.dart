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
import 'package:work_flow/core/domain/contract/repository/image/delete_image_repository.dart'
    as _i37;
import 'package:work_flow/core/domain/contract/repository/image/get_images_repository.dart'
    as _i214;
import 'package:work_flow/core/domain/contract/repository/image/post_image_repository.dart'
    as _i535;
import 'package:work_flow/core/domain/contract/repository/image/put_image_repository.dart'
    as _i386;
import 'package:work_flow/core/domain/contract/repository/service_order/delete_service_order_repository.dart'
    as _i224;
import 'package:work_flow/core/domain/contract/repository/service_order/fetch_all_service_order_repository.dart'
    as _i397;
import 'package:work_flow/core/domain/contract/repository/service_order/get_service_order_repository.dart'
    as _i945;
import 'package:work_flow/core/domain/contract/repository/service_order/post_service_order_repository.dart'
    as _i206;
import 'package:work_flow/core/domain/contract/repository/service_order/put_service_order_repository.dart'
    as _i165;
import 'package:work_flow/core/domain/contract/usecase/delete_service_order_usecase.dart'
    as _i584;
import 'package:work_flow/core/domain/contract/usecase/fetch_all_service_order_usecase.dart'
    as _i181;
import 'package:work_flow/core/domain/contract/usecase/get_service_order_usecase.dart'
    as _i937;
import 'package:work_flow/core/domain/contract/usecase/post_service_order_usecase.dart'
    as _i598;
import 'package:work_flow/core/domain/contract/usecase/put_service_order_usecase.dart'
    as _i627;
import 'package:work_flow/core/domain/usecase/delete_service_order_usecase_impl.dart'
    as _i669;
import 'package:work_flow/core/domain/usecase/fetch_all_service_order_usecase_impl.dart'
    as _i197;
import 'package:work_flow/core/domain/usecase/get_service_order_usecase_impl.dart'
    as _i788;
import 'package:work_flow/core/domain/usecase/post_service_order_usecase_impl.dart'
    as _i496;
import 'package:work_flow/core/domain/usecase/put_service_order_usecase_impl.dart'
    as _i764;
import 'package:work_flow/modules/create_service_order/controller/add_service_order_controller.dart'
    as _i1066;
import 'package:work_flow/modules/home_page/controller/home_page_controller.dart'
    as _i566;
import 'package:work_flow/modules/service_order_details/controller/service_order_details_controller.dart'
    as _i735;
import 'package:work_flow/modules/update_service_order/controller/edit_service_order_controller.dart'
    as _i842;
import 'package:work_flow/repository/image/image/delete_image_repository_impl.dart'
    as _i813;
import 'package:work_flow/repository/image/image/get_images_repository_impl.dart'
    as _i516;
import 'package:work_flow/repository/image/image/post_image_repository_impl.dart'
    as _i207;
import 'package:work_flow/repository/image/image/put_image_repository_impl.dart'
    as _i110;
import 'package:work_flow/repository/service_order/delete_service_order_repository_impl.dart'
    as _i817;
import 'package:work_flow/repository/service_order/fetch_all_service_order_repository_impl.dart'
    as _i738;
import 'package:work_flow/repository/service_order/get_service_order_repository_impl.dart'
    as _i382;
import 'package:work_flow/repository/service_order/post_service_order_repository_impl.dart'
    as _i190;
import 'package:work_flow/repository/service_order/put_service_order_repository_impl.dart'
    as _i821;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i657.AppDatabase>(() => _i657.AppDatabase());
    gh.lazySingleton<_i165.PutServiceOrderRepository>(
      () => _i821.PutServiceOrderRepositoryImpl(
        dbProvider: gh<_i657.AppDatabase>(),
      ),
    );
    gh.lazySingleton<_i224.DeleteServiceOrderRepository>(
      () => _i817.DeleteServiceOrderRepositoryImpl(
        dbProvider: gh<_i657.AppDatabase>(),
      ),
    );
    gh.lazySingleton<_i945.GetServiceOrderRepository>(
      () => _i382.GetServiceOrderRepositoryImpl(gh<_i657.AppDatabase>()),
    );
    gh.lazySingleton<_i397.FetchAllServiceOrderRepository>(
      () => _i738.FetchAllServiceOrderRepositoryImpl(
        dbProvider: gh<_i657.AppDatabase>(),
      ),
    );
    gh.lazySingleton<_i386.PutImageRepository>(
      () => _i110.PutImageRepositoryImpl(dbProvider: gh<_i657.AppDatabase>()),
    );
    gh.lazySingleton<_i206.PostServiceOrderRepository>(
      () => _i190.PostServiceOrderRepositoryImpl(
        dbProvider: gh<_i657.AppDatabase>(),
      ),
    );
    gh.lazySingleton<_i535.PostImageRepository>(
      () => _i207.PostImageRepositoryImpl(dbProvider: gh<_i657.AppDatabase>()),
    );
    gh.lazySingleton<_i214.GetImagesRepository>(
      () => _i516.GetImagesRepositoryImpl(dbProvider: gh<_i657.AppDatabase>()),
    );
    gh.lazySingleton<_i37.DeleteImageRepository>(
      () =>
          _i813.DeleteImageRepositoryImpl(dbProvider: gh<_i657.AppDatabase>()),
    );
    gh.lazySingleton<_i181.FetchAllServiceOrderUsecase>(
      () => _i197.FetchAllServiceOrderUsecaseImpl(
        gh<_i397.FetchAllServiceOrderRepository>(),
      ),
    );
    gh.lazySingleton<_i627.PutServiceOrderUsecase>(
      () => _i764.PutServiceOrderUsecaseImpl(
        gh<_i165.PutServiceOrderRepository>(),
      ),
    );
    gh.factory<_i842.EditServiceOrderController>(
      () =>
          _i842.EditServiceOrderController(gh<_i627.PutServiceOrderUsecase>()),
    );
    gh.lazySingleton<_i584.DeleteServiceOrderUsecase>(
      () => _i669.DeleteServiceOrderUsecaseImpl(
        gh<_i224.DeleteServiceOrderRepository>(),
        gh<_i37.DeleteImageRepository>(),
      ),
    );
    gh.lazySingleton<_i937.GetServiceOrderUsecase>(
      () => _i788.GetServiceOrderUsecaseImpl(
        gh<_i945.GetServiceOrderRepository>(),
        gh<_i214.GetImagesRepository>(),
      ),
    );
    gh.lazySingleton<_i598.PostServiceOrderUsecase>(
      () => _i496.PostServiceOrderUsecaseImpl(
        gh<_i206.PostServiceOrderRepository>(),
        gh<_i535.PostImageRepository>(),
      ),
    );
    gh.factory<_i566.HomePageController>(
      () => _i566.HomePageController(
        deleteServiceOrderUsecase: gh<_i584.DeleteServiceOrderUsecase>(),
        fetchAllServiceOrderUsecase: gh<_i181.FetchAllServiceOrderUsecase>(),
        postServiceOrderUsecase: gh<_i598.PostServiceOrderUsecase>(),
        putServiceOrderUsecase: gh<_i627.PutServiceOrderUsecase>(),
      ),
    );
    gh.factory<_i1066.AddServiceOrderController>(
      () =>
          _i1066.AddServiceOrderController(gh<_i598.PostServiceOrderUsecase>()),
    );
    gh.factoryParam<_i735.ServiceOrderDetailsController, int, dynamic>(
      (serviceOrderId, _) => _i735.ServiceOrderDetailsController(
        gh<_i937.GetServiceOrderUsecase>(),
        serviceOrderId,
      ),
    );
    return this;
  }
}
