import 'package:bet_calculator/core/shared_keys.dart';
import 'package:bet_calculator/features/two_page/models/system_model/system_hive_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'get_system_cubit.freezed.dart';
part 'get_system_state.dart';

class GetSystemCubit extends Cubit<GetSystemState> {
  GetSystemCubit() : super(const GetSystemState.loading());

  getSystem() async {
    try {
      final incomeBox = await Hive.openBox<SystemHiveModel>(SharedKeys.system);
      emit(GetSystemState.success(incomeBox.values.toList()));
    } catch (e) {
      emit(GetSystemState.error(e.toString()));
    }
  }
}
