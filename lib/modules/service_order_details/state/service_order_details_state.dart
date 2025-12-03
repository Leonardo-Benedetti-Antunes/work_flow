import 'package:work_flow/core/domain/model/service_order_model.dart';

abstract class ServiceOrderDetailsState {}

class ServiceOrderDetailsStateLoading extends ServiceOrderDetailsState {}

class ServiceOrderDetailsStateLoaded extends ServiceOrderDetailsState {
  final ServiceOrderModel serviceOrderModel;

  ServiceOrderDetailsStateLoaded(this.serviceOrderModel);
}
