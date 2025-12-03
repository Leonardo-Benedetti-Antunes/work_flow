import 'package:flutter/material.dart';
import 'package:work_flow/core/domain/enum/status_enum.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';
import 'package:work_flow/modules/home_page/view/widgets/list_card_widget.dart';
import 'package:work_flow/modules/service_order_details/view/service_order_details_view.dart';
import 'package:work_flow/modules/update_service_order/view/edit_service_order_view.dart';

class ListViewWidget extends StatelessWidget {
  final List<ServiceOrderModel>? serviceOrderList;
  final Function()? onRefresh;
  final Function(int)? onDelete;

  const ListViewWidget({
    this.serviceOrderList,
    this.onRefresh,
    super.key,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Chip(label: Text(StatusEnum.naoIniciado.name)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Chip(label: Text(StatusEnum.iniciado.name)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Chip(label: Text(StatusEnum.finalizado.name)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Chip(label: Text(StatusEnum.cancelado.name)),
              ),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: serviceOrderList?.isEmpty ?? true
              ? const Center(child: Text("Nenhuma ordem de serviço encontrada"))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: serviceOrderList!.length,
                  itemBuilder: (context, index) {
                    final serviceOrder = serviceOrderList![index];

                    return Dismissible(
                      key: Key(serviceOrder.id.toString()),
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.endToStart) {
                          // Deslizar para esquerda = Excluir
                          return await _showDeleteDialog(context, serviceOrder);
                        } else if (direction == DismissDirection.startToEnd) {
                          // Deslizar para direita = Editar
                          await _navigateToEdit(context, serviceOrder);
                          return false; // Não remove o item
                        }
                        return false;
                      },
                      background: _buildEditBackground(),
                      secondaryBackground: _buildDeleteBackground(),
                      child: GestureDetector(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ServiceOrderDetailsView(id: serviceOrder.id),
                            ),
                          );

                          if (result == true && context.mounted) {
                            onRefresh?.call();
                          }
                        },
                        child: ListCardWidget(serviceOrder),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildEditBackground() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20),
      child: const Row(
        children: [
          Icon(Icons.edit, color: Colors.white, size: 28),
          SizedBox(width: 8),
          Text(
            'Editar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeleteBackground() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Excluir',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.delete, color: Colors.white, size: 28),
        ],
      ),
    );
  }

  Future<void> _navigateToEdit(
    BuildContext context,
    ServiceOrderModel serviceOrder,
  ) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditServiceOrderView(serviceOrder: serviceOrder),
      ),
    );

    if (result == true && context.mounted) {
      onRefresh?.call();
    }
  }

  Future<bool> _showDeleteDialog(
    BuildContext context,
    ServiceOrderModel serviceOrder,
  ) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirmar Exclusão'),
            content: Text('Deseja excluir a ordem "${serviceOrder.name}"?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context, true);

                  // Função delete
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Ordem excluída com sucesso!'),
                        backgroundColor: Colors.green,
                      ),
                    );

                    onRefresh?.call();
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  'Excluir',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}
