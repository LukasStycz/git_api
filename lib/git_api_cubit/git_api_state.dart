part of 'git_api_cubit.dart';

@immutable
abstract class GitApiState {
  const GitApiState();
}

class GitApiInitial extends GitApiState {
  final List<dynamic> receivedData;
  final List<Repositories> repositoriesNeededForBackButtonFromCommitsScreen;
  final bool errorMessageNeed;
  const GitApiInitial(
    this.receivedData,
    this.repositoriesNeededForBackButtonFromCommitsScreen,
    this.errorMessageNeed,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitApiInitial &&
          runtimeType == other.runtimeType &&
          receivedData == other.receivedData &&
          repositoriesNeededForBackButtonFromCommitsScreen ==
              other.repositoriesNeededForBackButtonFromCommitsScreen &&
          errorMessageNeed == other.errorMessageNeed;

  @override
  int get hashCode =>
      receivedData.hashCode ^
      repositoriesNeededForBackButtonFromCommitsScreen.hashCode ^
      errorMessageNeed.hashCode;
}

class GitApiUser extends GitApiState {
  final List<User> receivedData;
  final List<Repositories> repositoriesNeededForBackButtonFromCommitsScreen;
  final bool errorMessageNeed;

  const GitApiUser(
    this.receivedData,
    this.repositoriesNeededForBackButtonFromCommitsScreen,
    this.errorMessageNeed,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitApiUser &&
          runtimeType == other.runtimeType &&
          receivedData == other.receivedData &&
          repositoriesNeededForBackButtonFromCommitsScreen ==
              other.repositoriesNeededForBackButtonFromCommitsScreen &&
          errorMessageNeed == other.errorMessageNeed;

  @override
  int get hashCode =>
      receivedData.hashCode ^
      repositoriesNeededForBackButtonFromCommitsScreen.hashCode ^
      errorMessageNeed.hashCode;
}

class GitApiRepositories extends GitApiState {
  final List<Repositories> receivedData;
  final List<Repositories> repositoriesNeededForBackButtonFromCommitsScreen;
  final bool errorMessageNeed;

  const GitApiRepositories(
    this.receivedData,
    this.repositoriesNeededForBackButtonFromCommitsScreen,this.errorMessageNeed,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitApiRepositories &&
          runtimeType == other.runtimeType &&
          receivedData == other.receivedData &&
          repositoriesNeededForBackButtonFromCommitsScreen ==
              other.repositoriesNeededForBackButtonFromCommitsScreen &&
          errorMessageNeed == other.errorMessageNeed;

  @override
  int get hashCode =>
      receivedData.hashCode ^
      repositoriesNeededForBackButtonFromCommitsScreen.hashCode ^
      errorMessageNeed.hashCode;
}

class GitApiCommits extends GitApiState {
  final List<dynamic> receivedData;
  final List<Repositories> repositoriesNeededForBackButtonFromCommitsScreen;
  final bool errorMessageNeed;

  const GitApiCommits(
    this.receivedData,
    this.repositoriesNeededForBackButtonFromCommitsScreen,this.errorMessageNeed,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitApiCommits &&
          runtimeType == other.runtimeType &&
          receivedData == other.receivedData &&
          repositoriesNeededForBackButtonFromCommitsScreen ==
              other.repositoriesNeededForBackButtonFromCommitsScreen &&
          errorMessageNeed == other.errorMessageNeed;

  @override
  int get hashCode =>
      receivedData.hashCode ^
      repositoriesNeededForBackButtonFromCommitsScreen.hashCode ^
      errorMessageNeed.hashCode;
}

class GitApiLoading extends GitApiState {
  final List<dynamic> receivedData;
  final List<Repositories> repositoriesNeededForBackButtonFromCommitsScreen;
  final bool errorMessageNeed;
  const GitApiLoading(
    this.receivedData,
    this.repositoriesNeededForBackButtonFromCommitsScreen,this.errorMessageNeed,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitApiLoading &&
          runtimeType == other.runtimeType &&
          receivedData == other.receivedData &&
          repositoriesNeededForBackButtonFromCommitsScreen ==
              other.repositoriesNeededForBackButtonFromCommitsScreen &&
          errorMessageNeed == other.errorMessageNeed;

  @override
  int get hashCode =>
      receivedData.hashCode ^
      repositoriesNeededForBackButtonFromCommitsScreen.hashCode ^
      errorMessageNeed.hashCode;
}
