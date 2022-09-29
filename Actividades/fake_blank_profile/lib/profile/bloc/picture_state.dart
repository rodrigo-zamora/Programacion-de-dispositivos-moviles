// ignore_for_file: prefer_const_constructors_in_immutables

part of 'picture_bloc.dart';

@immutable
abstract class PictureState extends Equatable {
  const PictureState();

  @override
  List<Object?> get props => [];
}

class PictureInitial extends PictureState {}

class PictureErrorState extends PictureState {
  final String errorMessage;

  PictureErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class PictureSelectedState extends PictureState {
  final File? picture;

  PictureSelectedState({required this.picture});

  @override
  List<Object?> get props => [picture];
}
