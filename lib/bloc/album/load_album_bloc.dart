import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_project/model/album_model.dart';
import 'package:first_project/service/api.dart';

part 'load_album_event.dart';
part 'load_album_state.dart';

class LoadAlbumBloc extends Bloc<LoadAlbumEvent, LoadAlbumState> {
  final ApiServices _services;
  LoadAlbumBloc(this._services) : super(const LoadAlbumState()) {
    on<LoadAlbumEvent>((event, emit) async {
      emit(state.copyWith(status: PageStatus.initial));
      try {
        final response = await _services.fetchAlbum();
        emit(state.copyWith(
          status: PageStatus.success,
          result: List.of(state.result)..add(response)
        ));
      } catch (e) {
        emit(state.copyWith(status: PageStatus.failure,
        error: e.toString()));
      }
    });
  }
}
