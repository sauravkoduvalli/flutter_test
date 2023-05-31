part of 'load_album_bloc.dart';

abstract class AlbumEvent extends Equatable {
  const AlbumEvent();

  @override
  List<Object> get props => [];
}

class LoadAlbumEvent extends AlbumEvent {
  const LoadAlbumEvent();
}
