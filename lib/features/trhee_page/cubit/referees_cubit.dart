import 'package:bet_calculator/features/trhee_page/models/referees_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'referees_state.dart';

class RefereesCubit extends Cubit<RefereesState> {
  RefereesCubit() : super(RefereesLoading());

  Future getData() async {
    try {
      final data = await Dio().get(
          'https://bet-calculator-ab46b-default-rtdb.firebaseio.com/referees.json?auth=AIzaSyABSZ6UizXXvAtQ2hZqwR8d1YWIBRSCxr0');
      if (data.statusCode == 200) {
        if (data.data is List) {
          final List jsonData = data.data;
          final List<Referees> list =
              jsonData.map((e) => Referees.fromJson(e)).toList();
          emit(RefereesLoaded(list));
        }
      }
    } catch (e) {
      emit(RefereesError(e.toString()));
    }
  }
}
