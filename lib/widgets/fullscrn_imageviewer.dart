import 'dart:io';

import 'package:flutter/material.dart';

class ImagePreviewScreen extends StatelessWidget {

  const ImagePreviewScreen({
    super.key,
    required this.image,
    required this.onDone,
    required this.onRetake,
  });
  final File image;
  final VoidCallback onDone;
  final VoidCallback onRetake;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preview')),
      body: Column(
        children: [
          Expanded(child: Image.file(image)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.replay),
                onPressed: onRetake,
                label: const Text('Retake'),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.check),
                onPressed: onDone,
                label: const Text('Done'),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
