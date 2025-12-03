import 'package:flutter/material.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';
import 'package:work_flow/modules/create_service_order/view/widgets/select_images_widget.dart';
import 'package:work_flow/modules/create_service_order/view/widgets/service_order_field_widget.dart';
import 'package:work_flow/modules/update_service_order/controller/edit_service_order_controller.dart';
import 'package:work_flow/modules/update_service_order/state/edit_service_order_state.dart';

class EditServiceOrderFormWidget extends StatelessWidget {
  final EditServiceOrderFields fields;
  final EditServiceOrderController controller;
  final ServiceOrderModel serviceOrder;

  const EditServiceOrderFormWidget({
    super.key,
    required this.fields,
    required this.controller,
    required this.serviceOrder,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ServiceOrderFieldWidget(
            name: "Nome",
            controller: fields.nameController,
          ),
          const SizedBox(height: 16),
          ServiceOrderFieldWidget(
            name: "Descrição",
            controller: fields.descriptionController,
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          ServiceOrderFieldWidget(
            name: "Local",
            controller: fields.placeController,
          ),
          const SizedBox(height: 24),
          SelectImagesWidget(controller: fields.images),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              // Validação básica
              if (fields.nameController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Por favor, preencha o nome da ordem'),
                    backgroundColor: Colors.orange,
                  ),
                );
                return;
              }

              if (fields.placeController.text.trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Por favor, preencha o local'),
                    backgroundColor: Colors.orange,
                  ),
                );
                return;
              }

              // Cria o modelo atualizado mantendo o ID e status original
              final updatedServiceOrder = ServiceOrderModel(
                id: serviceOrder.id, // Mantém o ID original
                name: fields.nameController.text.trim(),
                status: serviceOrder.status, // Mantém o status original
                description: fields.descriptionController.text.trim(),
                location: fields.placeController.text.trim(),
                createdAt: serviceOrder.createdAt, // Mantém data de criação
                startedAt: serviceOrder.startedAt, // Mantém data de início
                finishedAt:
                    serviceOrder.finishedAt, // Mantém data de finalização
                images: fields.images,
              );

              // Chama o controller para atualizar a ordem
              await controller.putServiceOrderUsecase(
                updatedServiceOrder,
                fields.images,
                serviceOrder.id!,
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text("Atualizar"),
            ),
          ),
        ],
      ),
    );
  }
}
