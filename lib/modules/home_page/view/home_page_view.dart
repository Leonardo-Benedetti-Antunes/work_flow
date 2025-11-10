import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_flow/core/di/injection.dart';
import 'package:work_flow/modules/home_page/controller/home_page_controller.dart';
import 'package:work_flow/modules/home_page/state/home_page_state.dart';

class HomePageView extends StatelessWidget {
  final controller = getIt<HomePageController>();

  HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => controller,
      child: BlocBuilder<HomePageController, HomePageState>(
        builder: (context, state) {
          return Scaffold();
        },
      ),
    );
  }
}
