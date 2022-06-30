import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage == null
              ? const Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                )
              : Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.camera),
            label: const Text('Take Picture'),
          ),
        ),
      ],
    );
  }
}
