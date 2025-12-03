import 'package:flutter/material.dart';
import 'package:work_flow/core/domain/enum/status_enum.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';
import 'package:work_flow/modules/home_page/view/widgets/list_card_widget.dart';
import 'package:work_flow/modules/service_order_details/view/service_order_details_view.dart';

class ListViewWidget extends StatelessWidget {
  final List<ServiceOrderModel>? serviceOrderList;

  const ListViewWidget({this.serviceOrderList, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Chip(label: Text(StatusEnum.naoIniciado.name)),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Chip(label: Text(StatusEnum.iniciado.name)),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Chip(label: Text(StatusEnum.finalizado.name)),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Chip(label: Text(StatusEnum.cancelado.name)),
              ),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Selecionar Tudo",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text("Desativar", style: Theme.of(context).textTheme.titleMedium),
              Text("Excluir", style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),

        Divider(),

        Expanded(
          child: serviceOrderList?.isEmpty ?? true
              ? Center(child: Text("Nenhuma ordem de serviço encontrada"))
              : ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: serviceOrderList!.length,
                  itemBuilder: (context, index) {
                    final ServiceOrderModel serviceOrder =
                        serviceOrderList![index];
                    return GestureDetector(
                      onLongPress: () {
                        // TODO: select
                      },
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ServiceOrderDetailsView(id: serviceOrder.id),
                          ),
                        );
                      },
                      child: ListCardWidget(serviceOrder),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
