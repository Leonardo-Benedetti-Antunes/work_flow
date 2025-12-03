import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:work_flow/core/domain/model/image_model.dart';
import 'package:work_flow/core/domain/model/service_order_model.dart';
import 'package:work_flow/core/domain/enum/status_enum.dart';

class ProgressStatusDialog extends StatefulWidget {
  final ServiceOrderModel serviceOrder;
  final StatusEnum nextStatus;
  final String buttonText;
  final Function(StatusEnum, ServiceOrderModel, List<ImageModel>) onConfirm;

  const ProgressStatusDialog({
    super.key,
    required this.serviceOrder,
    required this.nextStatus,
    required this.buttonText,
    required this.onConfirm,
  });

  @override
  State<ProgressStatusDialog> createState() => _ProgressStatusDialogState();
}

class _ProgressStatusDialogState extends State<ProgressStatusDialog> {
  final List<ImageModel> selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmar'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deseja ${widget.buttonText.toLowerCase()}?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            Text(
              'Adicionar imagens (opcional)',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SelectImagesWidget(controller: selectedImages),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            widget.onConfirm(
              widget.nextStatus,
              widget.serviceOrder,
              selectedImages,
            );
          },
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}

// Widget de Seleção de Imagens Simplificado para o Dialog
class SelectImagesWidget extends StatefulWidget {
  final List<ImageModel> controller;

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
      final bytes = await file.readAsBytes();
      final dir = await getApplicationDocumentsDirectory();
      final filePath =
          "${dir.path}/img_${DateTime.now().millisecondsSinceEpoch}_${file.name}";
      final savedFile = await File(filePath).writeAsBytes(bytes);

      widget.controller.add(
        ImageModel(
          id: null,
          serviceOrderId: 0,
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton.icon(
          onPressed: pickImages,
          icon: const Icon(Icons.add_photo_alternate),
          label: const Text("Selecionar Imagens"),
        ),
        const SizedBox(height: 12),
        if (widget.controller.isEmpty)
          const Text(
            "Nenhuma imagem selecionada.",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          )
        else
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.controller.map((img) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(img.imageUrl),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: -8,
                    top: -8,
                    child: IconButton(
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.red,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.controller.remove(img);
                        });
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
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
