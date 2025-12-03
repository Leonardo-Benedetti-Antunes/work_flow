import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:work_flow/core/domain/contract/usecase/get_service_order_usecase.dart';
import 'package:work_flow/modules/service_order_details/state/service_order_details_state.dart';

@injectable
class ServiceOrderDetailsController extends Cubit<ServiceOrderDetailsState> {
  final GetServiceOrderUsecase getServiceOrderUsecase;
  final int serviceOrderId;

  ServiceOrderDetailsController(
    this.getServiceOrderUsecase,
    @factoryParam this.serviceOrderId,
  ) : super(ServiceOrderDetailsStateLoading()) {
    getServiceOrderDetails(serviceOrderId);
  }

  Future<void> getServiceOrderDetails(int serviceOrderId) async {
    emit(ServiceOrderDetailsStateLoading());
    final serviceOrderDetails = await getServiceOrderUsecase(serviceOrderId);
    emit(ServiceOrderDetailsStateLoaded(serviceOrderDetails));
  }
}
