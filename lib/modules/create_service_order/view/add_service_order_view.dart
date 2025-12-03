import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_flow/core/di/injection.dart';
import 'package:work_flow/modules/create_service_order/controller/add_service_order_controller.dart';
import 'package:work_flow/modules/create_service_order/state/add_service_order_state.dart';
import 'package:work_flow/modules/create_service_order/view/widgets/service_order_form_widget.dart';

class AddServiceOrderView extends StatelessWidget {
  final controller = getIt<AddServiceOrderController>();
  AddServiceOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => controller,
      child: BlocBuilder<AddServiceOrderController, AddServiceOrderState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Nova Ordem de Serviço"),
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
            body: state is AddServiceOrderFields
                ? ServiceOrderFormWidget(fields: state, controller: controller)
                : Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
