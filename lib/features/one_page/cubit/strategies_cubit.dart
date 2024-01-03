import 'package:bet_calculator/features/one_page/models/strategies_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'strategies_state.dart';

class StrategiesCubit extends Cubit<StrategiesState> {
  StrategiesCubit() : super(StrategiesLoading());

  Future getData() async {
    try {
      final data = await Dio().get(
          'https://bet-calculator-ab46b-default-rtdb.firebaseio.com/strategies.json?auth=AIzaSyABSZ6UizXXvAtQ2hZqwR8d1YWIBRSCxr0');
      if (data.statusCode == 200) {
        if (data.data is List) {
          final List jsonData = data.data;
          final List<Strategies> list =
              jsonData.map((e) => Strategies.fromJson(e)).toList();
          emit(StrategiesLoaded(list));
        }
      }
    } catch (e) {
      emit(StrategiesError(e.toString()));
    }
  }
}
