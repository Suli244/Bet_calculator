import 'package:bet_calculator/features/one_page/cubit/strategies_cubit.dart';
import 'package:bet_calculator/features/one_page/strategy_detail_page.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:bet_calculator/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBarBetCalculator(
          title: 'Strategies',
        ),
        body: BlocBuilder<StrategiesCubit, StrategiesState>(
          bloc: StrategiesCubit()..getData(),
          builder: (context, state) {
            if (state is StrategiesLoaded) {
              return ListView.separated(
                itemCount: state.data.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StrategyDetailPage(data: state.data[index])));
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: index == 0 ? 24 : 0,
                        bottom: index + 1 == (state.data.length) ? 24 : 0),
                    height: MediaQuery.of(context).size.width * 0.33,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    child: Stack(
                      children: [
                        Image.network(
                          state.data[index].image!,
                          fit: BoxFit.fitWidth,
                          width: MediaQuery.of(context).size.width - 48,
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.25),
                          child: Center(
                              child: Text(
                            state.data[index].title!,
                            style: AppTextStylesBetCalculator.s20W600(
                                color: Colors.white),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is StrategiesError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
