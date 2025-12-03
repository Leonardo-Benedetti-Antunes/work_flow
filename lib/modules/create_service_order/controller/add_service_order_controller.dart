import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:work_flow/core/domain/model/image_model.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';
import 'package:work_flow/modules/create_service_order/core/domain/contract/usecase/service_order/post_service_order_usecase.dart';
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
      // Emite estado de loading
      emit(AddServiceOrderLoading());

      // Chama o usecase para criar a ordem
      await postServiceOrderUsecase(serviceOrderModel, images);

      // Emite estado de sucesso
      emit(AddServiceOrderSuccess(serviceOrderModel));
    } catch (e) {
      // Emite estado de erro
      emit(AddServiceOrderError(e.toString()));

      // Volta para o estado de campos para permitir nova tentativa
      await Future.delayed(const Duration(milliseconds: 100));
      emit(AddServiceOrderFields());
    }
  }

  void resetToFields() {
    emit(AddServiceOrderFields());
  }
}
