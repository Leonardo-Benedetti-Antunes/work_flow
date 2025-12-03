import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:work_flow/core/domain/model/image_model.dart';

class SelectImagesWidget extends StatefulWidget {
  final List<ImageModel>? controller;

  const SelectImagesWidget({super.key, required this.controller});

  @override
  State<SelectImagesWidget> createState() => _SelectImagesWidgetState();
}

class _SelectImagesWidgetState extends State<SelectImagesWidget> {
  Future<void> pickImages() async {
    final picker = ImagePicker();

    final pickedFiles = await picker.pickMultiImage(imageQuality: 70);

    if (pickedFiles == null || pickedFiles.isEmpty) return;

    for (var file in pickedFiles) {
      Uint8List bytes = await file.readAsBytes();

      final dir = await getApplicationDocumentsDirectory();
      final filePath =
          "${dir.path}/img_${DateTime.now().millisecondsSinceEpoch}_${file.name}";

      final savedFile = await File(filePath).writeAsBytes(bytes);

      widget.controller?.add(
        ImageModel(
          id: null,
          serviceOrderId: 0, // você preenche depois
          title: null,
          imageUrl: savedFile.path,
        ),
      );
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          onPressed: pickImages,
          icon: const Icon(Icons.add_photo_alternate),
          label: const Text("Selecionar Imagens"),
        ),

        const SizedBox(height: 16),

        (widget.controller == null || widget.controller!.isEmpty)
            ? const Text("Nenhuma imagem selecionada.")
            : Wrap(
                spacing: 10,
                runSpacing: 10,
                children: widget.controller!.map((img) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(img.imageUrl),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: -8,
                        top: -8,
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              widget.controller?.remove(img);
                            });
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
      ],
    );
  }
}
