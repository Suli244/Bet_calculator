import 'package:bet_calculator/features/trhee_page/cubit/referees_cubit.dart';
import 'package:bet_calculator/features/trhee_page/refery_detail_page.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:bet_calculator/widgets/custom_app_bar.dart';
import 'package:bet_calculator/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TrheePage extends StatelessWidget {
  const TrheePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBarBetCalculator(
          title: 'List of referees',
        ),
        body: BlocBuilder<RefereesCubit, RefereesState>(
          bloc: RefereesCubit()..getData(),
          builder: (context, state) {
            if (state is RefereesLoaded) {
              return MasonryGridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                shrinkWrap: true,
                itemCount: state.data.length,
                crossAxisCount: 2,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ReferyDetailPage(data: state.data[index])));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: (context.width - 68) / 2 + 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey),
                        child: Image.network(
                          state.data[index].image!,
                          fit: BoxFit.fitWidth,
                          width: (context.width - 68) / 2,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        state.data[index].name!,
                        style: AppTextStylesBetCalculator.s14W600(),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        state.data[index].type!,
                        style: AppTextStylesBetCalculator.s12W400(),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is RefereesError) {
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
