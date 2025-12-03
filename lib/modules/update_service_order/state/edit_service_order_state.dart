import 'package:flutter/material.dart';
import 'package:work_flow/core/domain/model/image_model.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';

abstract class EditServiceOrderState {}

class EditServiceOrderLoading extends EditServiceOrderState {}

class EditServiceOrderFields extends EditServiceOrderState {
  final ServiceOrderModel serviceOrder;
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController placeController;
  final List<ImageModel> images;

  EditServiceOrderFields({
    required this.serviceOrder,
    required this.nameController,
    required this.descriptionController,
    required this.placeController,
    required this.images,
  });
}

class EditServiceOrderUpdating extends EditServiceOrderState {}

class EditServiceOrderUpdated extends EditServiceOrderState {
  final ServiceOrderModel serviceOrder;

  EditServiceOrderUpdated(this.serviceOrder);
}

class EditServiceOrderError extends EditServiceOrderState {
  final String message;

  EditServiceOrderError(this.message);
}
