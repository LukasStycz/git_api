part of 'user_cubit.dart';

@immutable
abstract class UserState {
  const UserState();
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  final User receivedUser;

  const UserLoaded(this.receivedUser);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLoaded &&
          runtimeType == other.runtimeType &&
          receivedUser == other.receivedUser;

  @override
  int get hashCode => receivedUser.hashCode;
}

class UserError extends UserState {
  const UserError();
}
