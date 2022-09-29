// ignore_for_file: override_on_non_overriding_member

part of 'picture_bloc.dart';

@immutable
abstract class PictureEvent extends Equatable {
  const PictureEvent();

  @override
  List<Object> get props => [];
}

class ChangeImageEvent extends PictureEvent {}
