part of 'commits_cubit.dart';

@freezed
class CommitsState with _$CommitsState {
  const factory CommitsState.initial() = CommitsInitial;
  const factory CommitsState.loading() = CommitsLoading;
  const factory CommitsState.loaded(List<Commits> receivedCommits) =
      CommitsLoaded;
  const factory CommitsState.error() = CommitsError;
}
