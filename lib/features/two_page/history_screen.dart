import 'package:bet_calculator/core/shared_keys.dart';
import 'package:bet_calculator/features/two_page/logic/get_express_cubit/get_express_cubit.dart';
import 'package:bet_calculator/features/two_page/logic/get_system_cubit/get_system_cubit.dart';
import 'package:bet_calculator/features/two_page/widgets/express_item_widget.dart';
import 'package:bet_calculator/features/two_page/widgets/system_item_widget.dart';
import 'package:bet_calculator/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarBetCalculator(title: 'History'),
      body: type == SharedKeys.express
          ? BlocProvider(
              create: (context) => GetExpressCubit()..getExpress(),
              child: BlocBuilder<GetExpressCubit, GetExpressState>(
                builder: (context, state) {
                  return state.when(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (error) => Center(
                      child: Text(error),
                    ),
                    success: (model) => ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: model.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) => ExpressItemWidget(
                        model: model[index],
                      ),
                    ),
                  );
                },
              ),
            )
          : BlocProvider(
              create: (context) => GetSystemCubit()..getSystem(),
              child: BlocBuilder<GetSystemCubit, GetSystemState>(
                builder: (context, state) {
                  return state.when(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (error) => Center(
                      child: Text(error),
                    ),
                    success: (model) => ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: model.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) => SystemItemWidget(
                        model: model[index],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
