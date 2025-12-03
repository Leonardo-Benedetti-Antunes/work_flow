import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_flow/core/di/injection.dart';
import 'package:work_flow/modules/service_order_details/controller/service_order_details_controller.dart';
import 'package:work_flow/modules/service_order_details/state/service_order_details_state.dart';

class ServiceOrderDetailsView extends StatelessWidget {
  final int? id;

  const ServiceOrderDetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final controller = getIt<ServiceOrderDetailsController>(param1: id);
    return BlocProvider(
      create: (context) => controller,
      child:
          BlocBuilder<ServiceOrderDetailsController, ServiceOrderDetailsState>(
            builder: (context, state) {
              return state is ServiceOrderDetailsStateLoaded
                  ? Scaffold(
                      body: Column(
                        children: [
                          Image.file(
                            File(
                              state.serviceOrderModel.images!.first.imageUrl,
                            ),
                          ),
                        ],
                      ),
                    )
                  : CircularProgressIndicator();
            },
          ),
    );
  }
}
