import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/delete_service_order_usecase.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/fetch_all_service_order_usecase.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/get_service_order_usecase.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/post_service_order_usecase.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/put_service_order_usecase.dart';
import 'package:work_flow/modules/home_page/core/domain/model/service_order_model.dart';
import 'package:work_flow/modules/home_page/state/home_page_state.dart';

@injectable
class HomePageController extends Cubit<HomePageState> {
  final DeleteServiceOrderUsecase deleteServiceOrderUsecase;
  final FetchAllServiceOrderUsecase fetchAllServiceOrderUsecase;
  final GetServiceOrderUsecase getServiceOrderUsecase;
  final PostServiceOrderUsecase postServiceOrderUsecase;
  final PutServiceOrderUsecase putServiceOrderUsecase;

  HomePageController({
    required this.deleteServiceOrderUsecase,
    required this.fetchAllServiceOrderUsecase,
    required this.getServiceOrderUsecase,
    required this.postServiceOrderUsecase,
    required this.putServiceOrderUsecase,
  }) : super(HomePageInicialization()) {
    fetchAllServiceOrder();
  }

  Future<void> deleteServiceOrder(int id) async {
    emit(HomePageLoading());
    await deleteServiceOrderUsecase(id);
    await fetchAllServiceOrder();
  }

  Future<void> fetchAllServiceOrder() async {
    emit(HomePageLoading());
    final serviceOrdersList = await fetchAllServiceOrderUsecase();
    emit(HomePageLoaded(serviceOrdersList));
  }

  Future<void> getServiceOrder(int id) async {
    emit(HomePageLoading());
    final serviceOrderList = await getServiceOrderUsecase(id);
    emit(HomePageLoaded([serviceOrderList]));
  }

  Future<void> postServiceOrder(ServiceOrderModel serviceOrderModel) async {
    emit(HomePageLoading());
    await postServiceOrderUsecase(serviceOrderModel);
    await fetchAllServiceOrder();
  }

  Future<void> putServiceOrder(
    ServiceOrderModel serviceOrderModel,
    int id,
  ) async {
    emit(HomePageLoading());
    await putServiceOrderUsecase(serviceOrderModel, id);
    await fetchAllServiceOrder();
  }
}
