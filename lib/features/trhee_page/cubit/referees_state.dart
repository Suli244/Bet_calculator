part of 'referees_cubit.dart';

@immutable
sealed class RefereesState {}

final class RefereesLoading extends RefereesState {}

final class RefereesLoaded extends RefereesState {
  RefereesLoaded(this.data);
  final List<Referees> data;
}

final class RefereesError extends RefereesState {
  RefereesError(this.message);
  final String message;
}
