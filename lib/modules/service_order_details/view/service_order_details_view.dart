import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_flow/core/di/injection.dart';
import 'package:work_flow/core/domain/enum/status_enum.dart';
import 'package:work_flow/modules/service_order_details/controller/service_order_details_controller.dart';
import 'package:work_flow/modules/service_order_details/state/service_order_details_state.dart';
import 'package:intl/intl.dart';
import 'package:work_flow/modules/service_order_details/view/components/ProgressStatusDialog.dart';

class ServiceOrderDetailsView extends StatelessWidget {
  final int? id;

  const ServiceOrderDetailsView({super.key, required this.id});

  String _formatDate(DateTime? date) {
    if (date == null) return 'Não definido';
    return DateFormat('dd/MM/yyyy HH:mm').format(date);
  }

  String _getStatusText(StatusEnum status) {
    switch (status) {
      case StatusEnum.naoIniciado:
        return 'Não Iniciado';
      case StatusEnum.iniciado:
        return 'Em Andamento';
      case StatusEnum.finalizado:
        return 'Finalizado';
      case StatusEnum.cancelado:
        return 'Cancelado';
    }
  }

  Color _getStatusColor(StatusEnum status) {
    switch (status) {
      case StatusEnum.naoIniciado:
        return Colors.grey;
      case StatusEnum.iniciado:
        return Colors.blue;
      case StatusEnum.finalizado:
        return Colors.green;
      case StatusEnum.cancelado:
        return Colors.red;
    }
  }

  StatusEnum? _getNextStatus(StatusEnum currentStatus) {
    switch (currentStatus) {
      case StatusEnum.naoIniciado:
        return StatusEnum.iniciado;
      case StatusEnum.iniciado:
        return StatusEnum.finalizado;
      case StatusEnum.finalizado:
        return null;
      case StatusEnum.cancelado:
        return null; // Não há próxima etapa
    }
  }

  String _getNextStatusButtonText(StatusEnum currentStatus) {
    switch (currentStatus) {
      case StatusEnum.naoIniciado:
        return 'Iniciar Ordem';
      case StatusEnum.iniciado:
        return 'Finalizar Ordem';
      case StatusEnum.finalizado:
      case StatusEnum.cancelado:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = getIt<ServiceOrderDetailsController>(param1: id);
    return BlocProvider(
      create: (context) => controller,
      child: BlocBuilder<ServiceOrderDetailsController, ServiceOrderDetailsState>(
        builder: (context, state) {
          if (state is! ServiceOrderDetailsStateLoaded) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final serviceOrder = state.serviceOrderModel;
          final nextStatus = _getNextStatus(serviceOrder.status);

          return Scaffold(
            appBar: AppBar(
              title: const Text('Detalhes da Ordem'),
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Carrossel de Imagens
                  if (serviceOrder.images != null &&
                      serviceOrder.images!.isNotEmpty)
                    SizedBox(
                      height: 300,
                      child: PageView.builder(
                        itemCount: serviceOrder.images!.length,
                        itemBuilder: (context, index) {
                          return Image.file(
                            File(serviceOrder.images![index].imageUrl),
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    )
                  else
                    Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          size: 64,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Status Badge
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Chip(
                            label: Text(
                              _getStatusText(serviceOrder.status),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: _getStatusColor(
                              serviceOrder.status,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Nome
                        Text(
                          serviceOrder.name,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 24),

                        // Descrição
                        if (serviceOrder.description != null &&
                            serviceOrder.description!.isNotEmpty) ...[
                          Text(
                            'Descrição',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            serviceOrder.description!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 24),
                        ],

                        // Local
                        if (serviceOrder.location != null &&
                            serviceOrder.location!.isNotEmpty) ...[
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.red),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  serviceOrder.location!,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                        ],

                        // Timeline
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Linha do Tempo',
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 16),
                                _buildTimelineItem(
                                  context,
                                  icon: Icons.add_circle_outline,
                                  title: 'Criado',
                                  date: _formatDate(serviceOrder.createdAt),
                                ),
                                if (serviceOrder.startedAt != null)
                                  _buildTimelineItem(
                                    context,
                                    icon: Icons.play_circle_outline,
                                    title: 'Iniciado',
                                    date: _formatDate(serviceOrder.startedAt),
                                  ),
                                if (serviceOrder.finishedAt != null)
                                  _buildTimelineItem(
                                    context,
                                    icon: Icons.check_circle_outline,
                                    title: 'Finalizado',
                                    date: _formatDate(serviceOrder.finishedAt),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: nextStatus != null
                ? SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => ProgressStatusDialog(
                              serviceOrder: serviceOrder,
                              nextStatus: nextStatus,
                              buttonText: _getNextStatusButtonText(
                                serviceOrder.status,
                              ),
                              onConfirm: (status, order, images) {
                                // Chama o método do controller passando as imagens selecionadas
                                controller.updateStatus(status, order, images);
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          backgroundColor: _getStatusColor(nextStatus),
                        ),
                        child: Text(
                          _getNextStatusButtonText(serviceOrder.status),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                : null,
          );
        },
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String date,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
