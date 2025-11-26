import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/delete_service_order_usecase.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/fetch_all_service_order_usecase.dart';
import 'package:work_flow/modules/home_page/core/domain/contract/usecase/service_order/get_service_order_usecase.dart';
import 'package:work_flow/modules/create_service_order/core/domain/contract/usecase/service_order/post_service_order_usecase.dart';
import 'package:work_flow/modules/update_service_order/core/domain/contract/usecase/service_order/put_service_order_usecase.dart';
import 'package:work_flow/modules/create_service_order/state/add_service_order_state.dart';

@injectable
class ServiceOrderController extends Cubit<ServiceOrderState> {
  final DeleteServiceOrderUsecase deleteServiceOrderUsecase;
  final FetchAllServiceOrderUsecase fetchAllServiceOrderUsecase;
  final GetServiceOrderUsecase getServiceOrderUsecase;
  final PostServiceOrderUsecase postServiceOrderUsecase;
  final PutServiceOrderUsecase putServiceOrderUsecase;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController statuscontroller = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController createdController = TextEditingController();
  final TextEditingController initiatedController = TextEditingController();
  final TextEditingController finishedController = TextEditingController();

  ServiceOrderController(
    this.deleteServiceOrderUsecase,
    this.fetchAllServiceOrderUsecase,
    this.getServiceOrderUsecase,
    this.postServiceOrderUsecase,
    this.putServiceOrderUsecase,
  ) : super(ServiceOrderStateCreate());
}
