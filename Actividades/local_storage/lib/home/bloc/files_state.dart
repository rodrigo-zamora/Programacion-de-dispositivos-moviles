// ignore_for_file: prefer_const_constructors_in_immutables

part of 'files_bloc.dart';

abstract class FilesState extends Equatable {
  const FilesState();

  @override
  List<Object> get props => [];
}

class FilesInitial extends FilesState {}

class FilesLoadingState extends FilesState {}

class FilesSavedSuccessState extends FilesState {}

class FilesSavedErrorState extends FilesState {
  final String error;

  FilesSavedErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class FilesReadErrorState extends FilesState {
  final String error;

  FilesReadErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

class FilesReadSuccessState extends FilesState {
  final String fileContent;

  FilesReadSuccessState({required this.fileContent});

  @override
  List<Object> get props => [fileContent];
}
