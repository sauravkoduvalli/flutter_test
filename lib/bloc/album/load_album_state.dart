part of 'load_album_bloc.dart';

enum PageStatus { initial, success, failure }

class LoadAlbumState extends Equatable {
  const LoadAlbumState({
    this.status = PageStatus.initial,
    this.error = "",
    this.result = const [],
  });

  final PageStatus status;
  final String error;
  final List<Album> result;

  LoadAlbumState copyWith({
    final PageStatus? status,
    final String? error,
    final List<Album>? result,
  }) {
    return LoadAlbumState(
      error: error ?? this.error,
      status: status ?? this.status,
      result: result ?? this.result,
    );
  }

  @override
  List<Object> get props => [status,error,result];
}
