import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_project/bottam__navigationbar/bottom_bar.dart';
import 'package:hive_project/core/constants/app_colors.dart';

class UploadDocumentsPage extends StatefulWidget {
  const UploadDocumentsPage({super.key});

  @override
  State<UploadDocumentsPage> createState() => _UploadDocumentsPageState();
}

class _UploadDocumentsPageState extends State<UploadDocumentsPage> {
  final Box box = Hive.box('documentsBox');

  File? frontLicense;
  File? backLicense;

  @override
  void initState() {
    super.initState();

    final frontPath = box.get('front');
    final backPath = box.get('back');

    if (frontPath != null && File(frontPath).existsSync()) {
      frontLicense = File(frontPath);
    }

    if (backPath != null && File(backPath).existsSync()) {
      backLicense = File(backPath);
    }
  }


  Future<File> saveFilePermanently(File file) async {
    final dir = await getApplicationDocumentsDirectory();
    final fileName = file.path.split('/').last;
    final newPath = '${dir.path}/$fileName';
    return file.copy(newPath);
  }

  Future<void> pickFile(bool isFront) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.single.path != null) {
      final tempFile = File(result.files.single.path!);
      final savedFile = await saveFilePermanently(tempFile);

      setState(() {
        if (isFront) {
          frontLicense = savedFile;
          box.put('front', savedFile.path);
        } else {
          backLicense = savedFile;
          box.put('back', savedFile.path);
        }
      });
    }
  }

  void deleteFile(bool isFront) {
    setState(() {
      if (isFront) {
        frontLicense = null;
        box.delete('front');
      } else {
        backLicense = null;
        box.delete('back');
      }
    });
  }

  void showSuccessPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          "Verification Submitted",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "Your driving license has been submitted successfully.\n\n"
          "Our team will verify your documents shortly.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const BottomBar()),
              );
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  Widget uploadBox(VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.blue.shade200, width: 1.5),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.upload_file, size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text("Tap to upload"),
            Text("JPG / PNG", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget uploadedCard(File file, VoidCallback onDelete) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.backGround1,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              file,
              width: 55,
              height: 55,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  file.path.split('/').last,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Uploaded",
                  style: TextStyle(color: Colors.green, fontSize: 13),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        backgroundColor: AppColors.backGround,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Verify your Identity",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Please upload clear photos of your driver’s license.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 28),

            const Text("Front of Driver’s License"),
            const SizedBox(height: 10),
            frontLicense == null
                ? uploadBox(() => pickFile(true))
                : uploadedCard(frontLicense!, () => deleteFile(true)),

            const SizedBox(height: 28),

            const Text("Back of Driver’s License"),
            const SizedBox(height: 10),
            backLicense == null
                ? uploadBox(() => pickFile(false))
                : uploadedCard(backLicense!, () => deleteFile(false)),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 52,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed:
                frontLicense != null && backLicense != null
                    ? showSuccessPopup
                    : null,
            child: const Text(
              "Submit for Verification",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
