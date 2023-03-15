part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = UserInitial;
  const factory UserState.loading() = UserLoading;
  const factory UserState.loaded(User receivedUser) = UserLoaded;
  const factory UserState.error() = UserError;
}
