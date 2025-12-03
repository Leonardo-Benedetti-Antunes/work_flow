import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:work_flow/core/domain/contract/usecase/get_service_order_usecase.dart';
import 'package:work_flow/core/domain/contract/usecase/put_service_order_usecase.dart';
import 'package:work_flow/core/domain/enum/status_enum.dart';
import 'package:work_flow/core/domain/model/image_model.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';
import 'package:work_flow/modules/service_order_details/state/service_order_details_state.dart';

@injectable
class ServiceOrderDetailsController extends Cubit<ServiceOrderDetailsState> {
  final GetServiceOrderUsecase getServiceOrderUsecase;
  final PutServiceOrderUsecase putServiceOrderUseCase;

  final int serviceOrderId;

  ServiceOrderDetailsController(
    this.getServiceOrderUsecase,
    this.putServiceOrderUseCase,
    @factoryParam this.serviceOrderId,
  ) : super(ServiceOrderDetailsStateLoading()) {
    getServiceOrderDetails(serviceOrderId);
  }

  Future<void> getServiceOrderDetails(int serviceOrderId) async {
    emit(ServiceOrderDetailsStateLoading());
    final serviceOrderDetails = await getServiceOrderUsecase(serviceOrderId);
    emit(ServiceOrderDetailsStateLoaded(serviceOrderDetails));
  }

  Future<void> updateStatus(
    StatusEnum? nextStatus,
    ServiceOrderModel serviceOrder,
    List<ImageModel>? images,
  ) async {
    final imagesToUpload = serviceOrder.images;
    if (images != null) {
      imagesToUpload?.addAll(images);
    }
    putServiceOrderUseCase(
      ServiceOrderModel(
        id: serviceOrder.id,
        name: serviceOrder.name,
        status: nextStatus ?? serviceOrder.status,
        description: serviceOrder.description,
        createdAt: serviceOrder.createdAt,
        startedAt: nextStatus == StatusEnum.iniciado
            ? DateTime.now()
            : serviceOrder.startedAt,
        finishedAt: nextStatus == StatusEnum.finalizado
            ? DateTime.now()
            : serviceOrder.finishedAt,
        location: serviceOrder.location,
      ),
      imagesToUpload,
      serviceOrder.id!,
    );
  }
}
