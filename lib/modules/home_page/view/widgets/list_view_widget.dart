import 'package:flutter/material.dart';
import 'package:work_flow/modules/home_page/core/domain/model/service_order_model.dart';

class ListViewWidget extends StatelessWidget {
  final List<ServiceOrderModel> serviceOrderList;

  const ListViewWidget({required this.serviceOrderList, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: serviceOrderList.length,
      itemBuilder: (context, index) {
        final serviceOrder = serviceOrderList[index];
        return Card(child: Text(serviceOrder.name));
      },
    );
  }
}
