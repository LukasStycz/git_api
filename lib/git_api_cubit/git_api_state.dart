part of 'git_api_cubit.dart';

@immutable
abstract class GitApiState {
  const GitApiState();
}

class GitApiInitial extends GitApiState {
  final List<dynamic> receivedData;
  const GitApiInitial(this.receivedData);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitApiInitial &&
          runtimeType == other.runtimeType &&
          receivedData == other.receivedData;

  @override
  int get hashCode => receivedData.hashCode;
}

class GitApiUser extends GitApiState {
  final List<User> receivedData;
  const GitApiUser(this.receivedData);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitApiUser &&
          runtimeType == other.runtimeType &&
          receivedData == other.receivedData;

  @override
  int get hashCode => receivedData.hashCode;
}

class GitApiRepositories extends GitApiState {
  final List<Repositories> receivedData;
  const GitApiRepositories(this.receivedData);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitApiRepositories &&
          runtimeType == other.runtimeType &&
          receivedData == other.receivedData;

  @override
  int get hashCode => receivedData.hashCode;
}

class GitApiCommits extends GitApiState {
  final List<dynamic> receivedData;
  const GitApiCommits(this.receivedData);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitApiCommits &&
          runtimeType == other.runtimeType &&
          receivedData == other.receivedData;

  @override
  int get hashCode => receivedData.hashCode;
}

class GitApiLoading extends GitApiState {
  final List<dynamic> receivedData;
  const GitApiLoading(this.receivedData);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitApiLoading &&
          runtimeType == other.runtimeType &&
          receivedData == other.receivedData;

  @override
  int get hashCode => receivedData.hashCode;
}
