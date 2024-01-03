part of 'get_express_cubit.dart';

@freezed
class GetExpressState with _$GetExpressState {
  const factory GetExpressState.loading() = _Loading;
  const factory GetExpressState.error(String error) = _Error;
  const factory GetExpressState.success(List<ExpressHiveModel> model) =
      _Success;
}
