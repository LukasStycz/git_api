part of 'repositories_cubit.dart';

@freezed
class RepositoriesState with _$RepositoriesState {
  const factory RepositoriesState.initial() = RepositoriesInitial;
  const factory RepositoriesState.loading() = RepositoriesLoading;
  const factory RepositoriesState.loaded(
      List<Repositories> receivedRepositories) = RepositoriesLoaded;
  const factory RepositoriesState.error() = RepositoriesError;
}
