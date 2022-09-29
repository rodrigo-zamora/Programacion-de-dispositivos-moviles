// ignore_for_file: depend_on_referenced_packages, unused_local_variable, unused_element, body_might_complete_normally_nullable

import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'picture_event.dart';
part 'picture_state.dart';

class PictureBloc extends Bloc<PictureEvent, PictureState> {
  PictureBloc() : super(PictureInitial()) {
    on<ChangeImageEvent>(_onTakePicture);
  }

  void _onTakePicture(PictureEvent event, Emitter emit) async {
    try {
      File? image = await _pickImage();
      if (image == null) {
        emit(PictureErrorState(errorMessage: 'No se pudo cargar la imagen'));
      } else {
        emit(PictureSelectedState(picture: image));
      }
    } catch (e) {
      emit(PictureErrorState(errorMessage: 'No se detectó la cámara'));
    }
  }

  Future<File?> _pickImage() async {
    final picker = ImagePicker();
    final XFile? chosenImage = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 720,
      maxWidth: 720,
      imageQuality: 85,
    );
    return chosenImage != null ? File(chosenImage.path) : null;
  }
}
