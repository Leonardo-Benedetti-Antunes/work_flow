import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_flow/core/di/injection.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';
import 'package:work_flow/modules/update_service_order/controller/edit_service_order_controller.dart';
import 'package:work_flow/modules/update_service_order/state/edit_service_order_state.dart';
import 'package:work_flow/modules/update_service_order/view/edit_service_order_form_widget.dart';

class EditServiceOrderView extends StatelessWidget {
  final ServiceOrderModel serviceOrder;

  const EditServiceOrderView({super.key, required this.serviceOrder});

  @override
  Widget build(BuildContext context) {
    final controller = getIt<EditServiceOrderController>();

    return BlocProvider(
      create: (context) {
        // Inicializa o controller com os dados da ordem
        controller.initialize(serviceOrder);
        return controller;
      },
      child: BlocConsumer<EditServiceOrderController, EditServiceOrderState>(
        listener: (context, state) {
          if (state is EditServiceOrderUpdated) {
            // Retorna para a tela anterior com true para indicar sucesso
            Navigator.pop(context, true);

            // Mostra mensagem de sucesso
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Ordem de serviço atualizada com sucesso!'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
          } else if (state is EditServiceOrderError) {
            // Mostra mensagem de erro
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Editar Ordem de Serviço"),
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
            body: Stack(
              children: [
                if (state is EditServiceOrderFields)
                  EditServiceOrderFormWidget(
                    fields: state,
                    controller: controller,
                    serviceOrder: serviceOrder,
                  )
                else if (state is EditServiceOrderLoading)
                  const Center(child: CircularProgressIndicator()),

                // Overlay de loading durante atualização
                if (state is EditServiceOrderUpdating)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 16),
                              Text('Atualizando ordem de serviço...'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
