import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hive/hive.dart';
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

    if (frontPath != null) frontLicense = File(frontPath);
    if (backPath != null) backLicense = File(backPath);
  }

  Future<void> pickFile(bool isFront) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.single.path != null) {
      final path = result.files.single.path!;
      setState(() {
        if (isFront) {
          frontLicense = File(path);
          box.put('front', path);
        } else {
          backLicense = File(path);
          box.put('back', path);
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

  void showImagePreview(File imageFile) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      builder: (_) => SafeArea(
        child: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(20),
                minScale: 0.8,
                maxScale: 4,
                child: Image.file(imageFile),
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: IconButton(
                icon: const Icon(Icons.close,
                    color: Colors.white, size: 30),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title, bool done) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        if (done)
          const Icon(Icons.check_circle,
              color: Colors.green, size: 20),
      ],
    );
  }

  Widget uploadBox(VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.blue.shade200, width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.upload_file,
                  size: 30, color: Colors.blue),
            ),
            const SizedBox(height: 12),
            const Text("Tap to upload",
                style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 4),
            const Text("JPG / PNG",
                style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget uploadedCard(File file, VoidCallback onDelete) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => showImagePreview(file),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.backGround1,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
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
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    file.path.split('/').last,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  const Text("Uploaded",
                      style:
                          TextStyle(color: Colors.green, fontSize: 13)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: onDelete,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backGround,
      ),

  
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Verify your Identity",
                style:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Please upload clear photos of your driver’s license.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 28),

            sectionTitle(
                "Front of Driver’s License", frontLicense != null),
            const SizedBox(height: 12),
            frontLicense == null
                ? uploadBox(() => pickFile(true))
                : uploadedCard(
                    frontLicense!, () => deleteFile(true)),

            const SizedBox(height: 28),

            sectionTitle(
                "Back of Driver’s License", backLicense != null),
            const SizedBox(height: 12),
            backLicense == null
                ? uploadBox(() => pickFile(false))
                : uploadedCard(
                    backLicense!, () => deleteFile(false)),
          ],
        ),
      ),

    
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed: frontLicense != null && backLicense != null
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            "Driving License Uploaded Successfully ✅"),
                        backgroundColor: Colors.green,
                      ),
                    );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const BottomBar()),
                    );
                  }
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
