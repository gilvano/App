import 'package:bloc/bloc.dart';
import 'package:entrega_app/infra/cache/secure_cache_storage_adapter_factory.dart';
import 'package:entrega_app/infra/cache/secure_storage_adapter.dart';
import 'package:entrega_app/infra/http/http_client_factory.dart';
import 'package:entrega_app/models/local_entrega_model.dart';
import 'package:entrega_app/repositories/local_entrega_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'local_entrega_state.dart';

class LocalEntregaBloc extends Cubit<LocalEntregaState> {
  LocalEntregaBloc() : super(LocalEntregaInitialState());

  final SecureStorageAdapter storage = makeSecureStorageAdapter();

  Future<void> getLocaisEntrega() async {
    var locais;
    try {
      emit(LocalEntregaLoadingState());
      LocalEntregaRepository repo =
          LocalEntregaRepository(makeHttpAdapter(storage));
      locais = await repo.getAll();
      emit(LocalEntregasLoadedState(locais));
    } catch (e) {
      emit(LocalEntregaErrorState(e.toString()));
    }
  }

  Future<void> saveLocalEntrega(String descricao) async {
    try {
      emit(LocalEntregaLoadingState());
      LocalEntregaRepository repo =
          LocalEntregaRepository(makeHttpAdapter(storage));
      await repo.saveLocalEntrega({
        "descricao": descricao,
      });
      emit(LocalEntregaSavedState());
    } catch (e) {
      emit(LocalEntregaErrorState(e.toString()));
    }
  }

  Future<void> editLocalEntrega(LocalEntregaModel localEntrega) async {
    try {
      emit(LocalEntregaUpdatingState());
      LocalEntregaRepository repo =
          LocalEntregaRepository(makeHttpAdapter(storage));
      await repo.editLocalEntrega(localEntrega); //emit(AuthSuccessState());
      emit(LocalEntregaUpdatedState(localEntrega));
    } catch (e) {
      emit(LocalEntregaErrorState(e.toString()));
    }
  }

  Future<void> deleteLocalEntrega(LocalEntregaModel localEntrega) async {
    try {
      emit(LocalEntregaDeletingState());
      LocalEntregaRepository repo =
          LocalEntregaRepository(makeHttpAdapter(storage));
      await repo.deleteLocalEntrega(localEntrega);
      emit(LocalEntregaDeletedState(localEntrega));
    } catch (e) {
      emit(LocalEntregaErrorState(e.toString()));
    }
  }
}
