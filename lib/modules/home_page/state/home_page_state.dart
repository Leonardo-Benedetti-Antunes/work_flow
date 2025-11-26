import 'package:work_flow/core/domain/model/service_order_model.dart';

abstract class HomePageState {}

class HomePageInicialization extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final List<ServiceOrderModel>? serviceOrders;

  HomePageLoaded(this.serviceOrders);
}
