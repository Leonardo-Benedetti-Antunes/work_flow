import 'package:flutter/material.dart';
import 'package:work_flow/core/domain/enum/status_enum.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';

class ListCardWidget extends StatelessWidget {
  final ServiceOrderModel serviceOrder;

  const ListCardWidget(this.serviceOrder, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    serviceOrder.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 8),
                Chip(
                  label: Text(
                    serviceOrder.status.name,
                    style: TextStyle(fontSize: 12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
            if (serviceOrder.description != null &&
                serviceOrder.description!.isNotEmpty) ...[
              SizedBox(height: 8),
              Text(
                serviceOrder.description!,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
