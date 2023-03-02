part of 'commits_cubit.dart';

@immutable
abstract class CommitsState {
  const CommitsState();
}

class CommitsInitial extends CommitsState {
  const CommitsInitial();
}

class CommitsLoading extends CommitsState {
  const CommitsLoading();
}

class CommitsLoaded extends CommitsState {
  final List<Commits> receivedCommits;
  const CommitsLoaded(this.receivedCommits);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommitsLoaded &&
          runtimeType == other.runtimeType &&
          receivedCommits == other.receivedCommits;

  @override
  int get hashCode => receivedCommits.hashCode;
}

class CommitsError extends CommitsState {
  const CommitsError();
}
