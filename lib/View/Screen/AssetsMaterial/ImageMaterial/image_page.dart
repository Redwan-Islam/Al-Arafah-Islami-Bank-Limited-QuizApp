import 'package:flutter/material.dart';
import 'package:quiz/Model/sampleImageModel/imageFile.dart';
import 'package:quiz/Model/sampleImageModel/questionImageModel.dart';
import 'package:quiz/View/Screen/AuthScreen/WelcomeScreen.dart';

class ImagePage extends StatelessWidget {
  final FirebaseFile file;

  const ImagePage({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isImage = ['.jpeg', '.jpg', '.png'].any(file.name.contains);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(file.name),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.file_download),
            onPressed: () async {
              await FirebaseApi.downloadFile(file.ref);

              final snackBar = SnackBar(
                content: Text('Downloaded ${file.name}'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          const SizedBox(width: 12),
        ],
      ),
      drawer: const DrawerWidget(),
      body: isImage
          ? Center(
              child: Image.network(
                file.url,
                height: 500,
                fit: BoxFit.cover,
              ),
            )
          : const Center(
              child: Text(
                'Cannot be displayed',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}
