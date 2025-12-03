import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:work_flow/core/domain/model/image_model.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';
import 'package:work_flow/core/domain/contract/usecase/post_service_order_usecase.dart';
import 'package:work_flow/modules/create_service_order/state/add_service_order_state.dart';

@injectable
class AddServiceOrderController extends Cubit<AddServiceOrderState> {
  final PostServiceOrderUsecase postServiceOrderUsecase;

  AddServiceOrderController(this.postServiceOrderUsecase)
    : super(AddServiceOrderFields());

  Future<void> postServiceOrder(
    ServiceOrderModel serviceOrderModel,
    List<ImageModel>? images,
  ) async {
    try {
      emit(AddServiceOrderLoading());

      await postServiceOrderUsecase(serviceOrderModel, images);

      emit(AddServiceOrderSuccess(serviceOrderModel));
    } catch (e) {
      emit(AddServiceOrderError(e.toString()));

      await Future.delayed(const Duration(milliseconds: 100));
      emit(AddServiceOrderFields());
    }
  }

  void resetToFields() {
    emit(AddServiceOrderFields());
  }
}
