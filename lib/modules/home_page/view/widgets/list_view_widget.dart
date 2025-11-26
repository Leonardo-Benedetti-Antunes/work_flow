import 'package:flutter/material.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';

class ListViewWidget extends StatelessWidget {
  final List<ServiceOrderModel>? serviceOrderList;

  const ListViewWidget({required this.serviceOrderList, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Chip(label: Text("Chip 1")),
              Chip(label: Text("Chip 2")),
            ],
          ),
          Row(children: [Text("data"), Text("data")]),

          Expanded(
            child: ListView.builder(
              itemCount: serviceOrderList?.length ?? 0,
              itemBuilder: (context, index) {
                final ServiceOrderModel? serviceOrder =
                    serviceOrderList?[index];
                return Card(child: Text(serviceOrder?.name ?? ""));
              },
            ),
          ),
        ],
      ),
    );
  }
}
