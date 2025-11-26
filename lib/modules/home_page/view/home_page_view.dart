import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_flow/core/di/injection.dart';
import 'package:work_flow/modules/home_page/controller/home_page_controller.dart';
import 'package:work_flow/modules/home_page/state/home_page_state.dart';
import 'package:work_flow/modules/home_page/view/widgets/list_view_widget.dart';
import 'package:work_flow/modules/create_service_order/view/add_service_order_view.dart';

class HomePageView extends StatelessWidget {
  final controller = getIt<HomePageController>();

  HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => controller,
      child: BlocBuilder<HomePageController, HomePageState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddServiceOrderView(),
                  ),
                );
              },
            ),
            appBar: AppBar(
              title: Row(children: [Text("Work Flow")]),
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
            body: Builder(
              builder: (context) {
                return state is HomePageLoaded
                    ? Center(
                        child: ListViewWidget(
                          serviceOrderList: state.serviceOrders,
                        ),
                      )
                    : Center(child: CircularProgressIndicator());
              },
            ),
          );
        },
      ),
    );
  }
}
