part of 'get_system_cubit.dart';

@freezed
class GetSystemState with _$GetSystemState {
  const factory GetSystemState.loading() = _Loading;
  const factory GetSystemState.error(String error) = _Error;
  const factory GetSystemState.success(List<SystemHiveModel> model) = _Success;
}
