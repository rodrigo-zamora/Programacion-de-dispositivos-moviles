// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'dart:async';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'files_event.dart';
part 'files_state.dart';

class FilesBloc extends Bloc<FilesEvent, FilesState> {
  FilesBloc() : super(FilesInitial()) {
    on<SaveFileEvent>(_saveFileToStorage);
    on<ReadFileEvent>(_readFileFromStorage);
  }

  FutureOr<void> _readFileFromStorage(
    ReadFileEvent event,
    Emitter<FilesState> emit,
  ) async {
    emit(FilesLoadingState());
    switch (event.storageName) {
      case 'tempDirectory':
        var _tempDir = await getTemporaryDirectory();
        var _fileContent = await _readFile(event.fileTitle, _tempDir);
        emit(FilesReadSuccessState(fileContent: _fileContent));
        break;
      case 'externalStorageDirectory':
        var _externalDir = await getExternalStorageDirectory();
        var _fileContent = await _readFile(event.fileTitle, _externalDir!);
        emit(FilesReadSuccessState(fileContent: _fileContent));
        break;
    }
  }

  FutureOr<void> _saveFileToStorage(event, emit) {
    // TODO: Mapeo: estado -> evento
  }

  Future<bool> _requestStoragePermission() async {
    var permission = await Permission.storage.status;
    if (permission == PermissionStatus.denied) {
      permission = await Permission.storage.request();
    }
    return permission == PermissionStatus.granted;
  }

  Future<void> _saveFile(
    String fileTitle,
    String fileContent,
    Directory directoryName,
  ) async {
    if (!await _requestStoragePermission()) {
      throw Exception("Permiso denegado");
    }

    final file = File("${directoryName.path}/$fileTitle.txt");
    await file.writeAsString(fileContent);
  }

  Future<String> _readFile(
    String fileTitle,
    Directory directoryName,
  ) async {
    if (!await _requestStoragePermission()) {
      throw Exception("Permiso denegado");
    }

    final file = File("${directoryName.path}/$fileTitle.txt");
    return await file.readAsString();
  }
}
