import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_project/core/constants/app_colors.dart';
import 'package:hive_project/features/user/auth/model/user_model.dart';
import 'package:hive_project/features/user/auth/service/user_service.dart';
import 'package:image_picker/image_picker.dart';

class PersonInformation extends StatefulWidget {
  const PersonInformation({super.key});

  @override
  State<PersonInformation> createState() => _PersonInformationState();
}

class _PersonInformationState extends State<PersonInformation> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();

  UserModel? user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        user = UserService.getCurrentUser();
      });
    });
  }

  Future<void> pickImage() async {
    if (user == null) return;

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      UserModel updatedUser = UserModel(
        name: user!.name,
        email: user!.email,
        password: user!.password,
        imagepath: image.path,
      );

      await UserService.updateCurrentUser(updatedUser);

      setState(() {
        user = updatedUser;
      });
    }
  }

  void editname(BuildContext context) {
    namecontroller.text = user?.name ?? "";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update name"),
          content: TextField(
            controller: namecontroller,
            decoration: const InputDecoration(hintText: "Enter new name"),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
            ElevatedButton(
              onPressed: () async {
                if (user != null && namecontroller.text.isNotEmpty) {
                  UserModel updatedUser = UserModel(
                    name: namecontroller.text,
                    email: user!.email,
                    password: user!.password,
                    imagepath: user!.imagepath,
                  );

                  await UserService.updateCurrentUser(updatedUser);
                  setState(() { user = updatedUser; });
                  Navigator.pop(context);
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void editEmail(BuildContext context) {
    emailController.text = user?.email ?? "";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Email"),
          content: TextField(
            controller: emailController,
            decoration: const InputDecoration(hintText: "Enter new email"),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
            ElevatedButton(
              onPressed: () async {
                if (user != null && emailController.text.isNotEmpty) {
                  UserModel updatedUser = UserModel(
                    name: user!.name,
                    email: emailController.text,
                    password: user!.password,
                    imagepath: user!.imagepath,
                  );

                  await UserService.updateCurrentUser(updatedUser);
                  setState(() { user = updatedUser; });
                  Navigator.pop(context);
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.backGround),
      backgroundColor: AppColors.backGround,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: user?.imagepath != null
                    ? FileImage(File(user!.imagepath!))
                    : const AssetImage("images/profile.png") as ImageProvider,
              ),
            ),
            const SizedBox(height: 5),
            const Text("change photo", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child: Row(
                children: const [
                  Text("Full Name", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: 300,
              child: ElevatedButton.icon(
                onPressed: () => editname(context),
                icon: const Icon(Icons.edit, size: 16),
                label: Text(user?.name ?? "No name", style: const TextStyle(fontSize: 15)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 5),
              child: Row(
                children: const [
                  Text("Email", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              width: 300,
              child: ElevatedButton.icon(
                onPressed: () => editEmail(context),
                icon: const Icon(Icons.edit, size: 16),
                label: Text(user?.email ?? "No Email", style: const TextStyle(fontSize: 15)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
