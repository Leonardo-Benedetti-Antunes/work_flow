import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_flow/core/di/injection.dart';
import 'package:work_flow/modules/create_service_order/controller/service_order_controller.dart';
import 'package:work_flow/modules/create_service_order/state/add_service_order_state.dart';
import 'package:work_flow/modules/create_service_order/view/widgets/service_order_rows.dart';

class AddServiceOrderView extends StatefulWidget {
  const AddServiceOrderView({super.key});

  @override
  State<AddServiceOrderView> createState() => _AddServiceOrderViewState();
}

class _AddServiceOrderViewState extends State<AddServiceOrderView> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final statusController = TextEditingController();
  final placeController = TextEditingController();
  final createdController = TextEditingController();
  final initiatedController = TextEditingController();
  final finishedController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    statusController.dispose();
    placeController.dispose();
    createdController.dispose();
    initiatedController.dispose();
    finishedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ServiceOrderController>(),
      child: BlocConsumer<ServiceOrderController, ServiceOrderState>(
        listener: (context, state) {
          if (state is ServiceOrderSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Ordem criada com sucesso!")),
            );
            Navigator.pop(context);
          }

          if (state is ServiceOrderError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final bloc = context.read<ServiceOrderController>();

          return Scaffold(
            appBar: AppBar(title: const Text("Criar ordem de serviço")),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ServiceOrderRows(name: "Nome", controller: nameController),
                  ServiceOrderRows(
                    name: "Descrição",
                    controller: descriptionController,
                  ),
                  ServiceOrderRows(
                    name: "Status",
                    controller: statusController,
                  ),
                  ServiceOrderRows(name: "Local", controller: placeController),
                  ServiceOrderRows(
                    name: "Criada",
                    controller: createdController,
                  ),
                  ServiceOrderRows(
                    name: "Iniciada",
                    controller: initiatedController,
                  ),
                  ServiceOrderRows(
                    name: "Finalizada",
                    controller: finishedController,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: state is ServiceOrderLoading
                        ? null
                        : () {
                            // bloc.createServiceOrder(
                            //   name: nameController.text,
                            //   description: descriptionController.text,
                            //   status: int.tryParse(statusController.text) ?? 0,
                            //   place: placeController.text,
                            //   createdAt: createdController.text,
                            //   startedAt: initiatedController.text,
                            //   finishedAt: finishedController.text,
                            // );
                          },
                    child: state is ServiceOrderLoading
                        ? const CircularProgressIndicator()
                        : const Text("Salvar"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
