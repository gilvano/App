part of 'local_entrega_bloc.dart';

@immutable
abstract class LocalEntregaState extends Equatable {
  const LocalEntregaState();

  @override
  List<Object> get props => [];
}

class LocalEntregaInitialState extends LocalEntregaState {}

class LocalEntregaLoadingState extends LocalEntregaState {}

class LocalEntregaUpdatingState extends LocalEntregaState {}

class LocalEntregaDeletingState extends LocalEntregaState {}

@immutable
class LocalEntregasLoadedState extends LocalEntregaState {
  final List<LocalEntregaModel> locaisEntrega;
  LocalEntregasLoadedState(this.locaisEntrega);

  @override
  List<Object> get props => [locaisEntrega];
}

class LocalEntregaSavedState extends LocalEntregaState {}

@immutable
class LocalEntregaUpdatedState extends LocalEntregaState {
  final LocalEntregaModel localEntrega;
  LocalEntregaUpdatedState(this.localEntrega);

  @override
  List<Object> get props => [localEntrega];
}

@immutable
class LocalEntregaDeletedState extends LocalEntregaState {
  final LocalEntregaModel localEntrega;
  LocalEntregaDeletedState(this.localEntrega);

  @override
  List<Object> get props => [localEntrega];
}

class LocalEntregaErrorState extends LocalEntregaState {
  final String message;
  LocalEntregaErrorState(this.message);

  @override
  List<Object> get props => [message];
}
