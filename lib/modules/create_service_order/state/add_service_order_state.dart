import 'package:flutter/widgets.dart';
import 'package:work_flow/core/domain/model/image_model.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';

abstract class AddServiceOrderState {}

class AddServiceOrderInitial extends AddServiceOrderState {}

class AddServiceOrderFields extends AddServiceOrderState {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final List<ImageModel> images = List.empty(growable: true);
}

class AddServiceOrderLoading extends AddServiceOrderState {}

class AddServiceOrderSuccess extends AddServiceOrderState {
  final ServiceOrderModel serviceOrder;

  AddServiceOrderSuccess(this.serviceOrder);
}

class AddServiceOrderError extends AddServiceOrderState {
  final String message;

  AddServiceOrderError(this.message);
}
