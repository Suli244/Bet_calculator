import 'package:bet_calculator/features/trhee_page/models/referees_model.dart';
import 'package:bet_calculator/theme/app_colors.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferyDetailPage extends StatelessWidget {
  const ReferyDetailPage({required this.data, super.key});
  final Referees data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            expandedHeight: 415.h,
            leading: IconButton(
              // iconSize: ,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                margin: const EdgeInsets.only(
                    // left: 20,
                    ),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.color000000,
                  ),
                ),
              ),
            ),
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    data.image!,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -7,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 30.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                  ),
                )
              ],
            ),
            // FlexibleSpaceBar(
            //   background: Image.network(
            //     data.image!,
            //     width: double.maxFinite,
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
          SliverToBoxAdapter(
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.45,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data.name} (${data.country})',
                      style: AppTextStylesBetCalculator.s24W600(),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      data.type!,
                      style: AppTextStylesBetCalculator.s20W500(),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '${data.description!} ${data.description!} ${data.description!}',
                      style: AppTextStylesBetCalculator.s16W400(height: 2),
                    ),
                    const SizedBox(height: 24)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
