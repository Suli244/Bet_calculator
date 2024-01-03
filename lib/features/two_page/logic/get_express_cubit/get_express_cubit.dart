import 'package:bet_calculator/core/shared_keys.dart';
import 'package:bet_calculator/features/two_page/models/express_model/express_hive_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'get_express_cubit.freezed.dart';
part 'get_express_state.dart';

class GetExpressCubit extends Cubit<GetExpressState> {
  GetExpressCubit() : super(const GetExpressState.loading());

  getExpress() async {
    try {
      final incomeBox =
          await Hive.openBox<ExpressHiveModel>(SharedKeys.express);
      emit(GetExpressState.success(incomeBox.values.toList()));
    } catch (e) {
      emit(GetExpressState.error(e.toString()));
    }
  }
}
