part of 'repositories_cubit.dart';

@immutable
abstract class RepositoriesState {
  const RepositoriesState();
}

class RepositoriesInitial extends RepositoriesState {
  const RepositoriesInitial();
}

class RepositoriesLoading extends RepositoriesState {
  const RepositoriesLoading();
}

class RepositoriesLoaded extends RepositoriesState {
  final List<Repositories> receivedRepositories;

  const RepositoriesLoaded(this.receivedRepositories);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepositoriesLoaded &&
          runtimeType == other.runtimeType &&
          receivedRepositories == other.receivedRepositories;

  @override
  int get hashCode => receivedRepositories.hashCode;
}

class RepositoriesError extends RepositoriesState {
  const RepositoriesError();
}
