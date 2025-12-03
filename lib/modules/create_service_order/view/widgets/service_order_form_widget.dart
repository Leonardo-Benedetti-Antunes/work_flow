import 'package:flutter/material.dart';
import 'package:work_flow/core/domain/enum/status_enum.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';
import 'package:work_flow/modules/create_service_order/controller/add_service_order_controller.dart';
import 'package:work_flow/modules/create_service_order/state/add_service_order_state.dart';
import 'package:work_flow/modules/create_service_order/view/widgets/select_images_widget.dart';
import 'package:work_flow/modules/create_service_order/view/widgets/service_order_field_widget.dart';

class ServiceOrderFormWidget extends StatelessWidget {
  final AddServiceOrderFields fields;
  final AddServiceOrderController controller;

  const ServiceOrderFormWidget({
    super.key,
    required this.fields,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ServiceOrderFieldWidget(
            name: "Nome",
            controller: fields.nameController,
          ),
          SizedBox(height: 16),
          ServiceOrderFieldWidget(
            name: "Descrição",
            controller: fields.descriptionController,
            maxLines: 3,
          ),
          SizedBox(height: 16),
          ServiceOrderFieldWidget(
            name: "Local",
            controller: fields.placeController,
          ),
          SizedBox(height: 24),
          SelectImagesWidget(controller: fields.images),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              await controller.postServiceOrder(
                ServiceOrderModel(
                  name: fields.nameController.text,
                  status: StatusEnum.naoIniciado,
                  description: fields.descriptionController.text,
                  location: fields.placeController.text,
                ),
                fields.images,
              );
              if (context.mounted) Navigator.pop(context, true);
            },
            child: Padding(padding: EdgeInsets.all(16), child: Text("Salvar")),
          ),
        ],
      ),
    );
  }
}
