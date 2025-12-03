import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:work_flow/core/domain/model/image_model.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';
import 'package:work_flow/core/domain/contract/usecase/put_service_order_usecase.dart';
import 'package:work_flow/modules/update_service_order/state/edit_service_order_state.dart';

@injectable
class EditServiceOrderController extends Cubit<EditServiceOrderState> {
  final PutServiceOrderUsecase putServiceOrderUsecase;

  EditServiceOrderController(this.putServiceOrderUsecase)
    : super(EditServiceOrderLoading());

  void initialize(ServiceOrderModel serviceOrder) {
    // Preenche os controllers com os dados existentes
    final nameController = TextEditingController(text: serviceOrder.name);
    final descriptionController = TextEditingController(
      text: serviceOrder.description,
    );
    final placeController = TextEditingController(text: serviceOrder.location);

    emit(
      EditServiceOrderFields(
        serviceOrder: serviceOrder,
        nameController: nameController,
        descriptionController: descriptionController,
        placeController: placeController,
        images: serviceOrder.images ?? [],
      ),
    );
  }

  Future<void> updateServiceOrder(
    ServiceOrderModel serviceOrderModel,
    List<ImageModel>? images,
    int id,
  ) async {
    try {
      // Emite estado de loading
      emit(EditServiceOrderUpdating());

      // Chama o usecase para atualizar a ordem
      await putServiceOrderUsecase(serviceOrderModel, images, id);

      // Emite estado de sucesso
      emit(EditServiceOrderUpdated(serviceOrderModel));
    } catch (e) {
      // Emite estado de erro
      emit(EditServiceOrderError(e.toString()));

      // Volta para o estado de campos para permitir nova tentativa
      await Future.delayed(const Duration(milliseconds: 100));

      // Precisamos manter os dados do formulário
      if (state is EditServiceOrderFields) {
        emit(state as EditServiceOrderFields);
      }
    }
  }

  @override
  Future<void> close() {
    // Limpa os controllers
    if (state is EditServiceOrderFields) {
      final fields = state as EditServiceOrderFields;
      fields.nameController.dispose();
      fields.descriptionController.dispose();
      fields.placeController.dispose();
    }
    return super.close();
  }
}
