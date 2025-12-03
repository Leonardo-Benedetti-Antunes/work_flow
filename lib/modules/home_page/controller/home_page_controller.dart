import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/delete_service_order_usecase.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/fetch_all_service_order_usecase.dart';
import 'package:work_flow/modules/create_service_order/core/domain/contract/usecase/service_order/post_service_order_usecase.dart';
import 'package:work_flow/modules/update_service_order/core/domain/contract/usecase/service_order/put_service_order_usecase.dart';
import 'package:work_flow/modules/home_page/state/home_page_state.dart';

@injectable
class HomePageController extends Cubit<HomePageState> {
  final DeleteServiceOrderUsecase deleteServiceOrderUsecase;
  final FetchAllServiceOrderUsecase fetchAllServiceOrderUsecase;
  final PostServiceOrderUsecase postServiceOrderUsecase;
  final PutServiceOrderUsecase putServiceOrderUsecase;

  HomePageController({
    required this.deleteServiceOrderUsecase,
    required this.fetchAllServiceOrderUsecase,
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
}
