part of 'strategies_cubit.dart';

@immutable
sealed class StrategiesState {}

final class StrategiesLoading extends StrategiesState {}

final class StrategiesLoaded extends StrategiesState {
  StrategiesLoaded(this.data);
  final List<Strategies> data;
}

final class StrategiesError extends StrategiesState {
  StrategiesError(this.message);
  final String message;
}
