import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quiz/Controller/DashcardDesign.dart';
import 'package:quiz/View/Screen/AssetsMaterial/ImageMaterial/image_page.dart';
import 'package:quiz/View/Screen/AssetsMaterial/ImageMaterial/image_preview.dart';
import 'package:quiz/View/Screen/AssetsMaterial/VideosMaterial/VideoAssetPlayer.dart';
import 'package:quiz/View/Screen/AuthScreen/WelcomeScreen.dart';
import 'package:quiz/View/Screen/DashboardScreen/DashboardScreen.dart';

class MaterialAcess extends StatefulWidget {
  static const String title = 'PDF Viewer';
  const MaterialAcess({Key? key}) : super(key: key);
  static const String routename = '/MaterialAccess';

  @override
  State<MaterialAcess> createState() => _MaterialAcessState();
}

class _MaterialAcessState extends State<MaterialAcess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Material Access'),
        centerTitle: true,
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 32.0,
          ),
          CarouselSliderWidget(),
          SizedBox(
            height: 32.0,
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: AdminDashboardGridview(),
            ),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
    );
  }
}

class AdminDashboardGridview extends StatelessWidget {
  const AdminDashboardGridview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      children: [
        DashcardDesign(
          text: 'PDF',
          image: 'assets/icons/pdf.png',
          onPressed: () {
            // const path = 'assets/PDF/sample.pdf';
            // final file = await PDFApi.loadAsset(path);
            // openPDF(context, file);
          },
        ),
        DashcardDesign(
            text: 'Audio', image: 'assets/icons/listen.png', onPressed: () {}),
        DashcardDesign(
          text: 'Video',
          image: 'assets/icons/streaming.png',
          onPressed: () {
            Navigator.pushNamed(context, VideoAssetPlayer.routename);
          },
        ),
        DashcardDesign(
          text: 'S.Questions',
          image: 'assets/icons/question.png',
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Image_preview()));
          },
        ),
      ],
    );
  }
}

// void openPDF(BuildContext context, File file) {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//         builder: (context) => PDFViewerPage(
//               file: file,
//               key: null,
//             )),
//   );
// }
