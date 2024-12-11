import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lost_and_found_project/item.dart';

class PostItemScreen extends StatefulWidget {

  const PostItemScreen( {super.key} );

  @override
  State<PostItemScreen> createState() {
    return _PostItemScreenState();
  }
}

class _PostItemScreenState extends State<PostItemScreen> {

  //text editing controllers for reaching to the text in text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  File? _selectedImage;

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedImage = File(result.files.single.path!);
      });
    }
  }

  void save(){

      if(_nameController.text.isEmpty || _descriptionController.text.isEmpty || _statusController.text.isEmpty || _dateController.text.isEmpty ){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Notification"),
              content: const Text("You must fill all fields before clicking save button."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Dismiss the dialog
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }else{
        Item item = new Item(_nameController.text , _descriptionController.text , _statusController.text , _dateController.text);
        //used .text at the end to get the value as string

        if (_selectedImage != null) {
          item.setImage(_selectedImage!);
        }

        Navigator.pop(context, item); // homes screen doesn't aware of the change so we are giving the new item to it
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post Item" , style: TextStyle(fontFamily: "SourGummy"),), centerTitle: true,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text("Item Name:", style: TextStyle(fontFamily: "SourGummy" ,fontSize: 18, fontWeight: FontWeight.bold)),

            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter item name" ,
              ),
              style: const TextStyle(fontFamily: "SourGummy" ,),
            ),

            const SizedBox(height: 16),

            const Text("Description:", style: TextStyle(fontFamily: "SourGummy" ,fontSize: 18, fontWeight: FontWeight.bold)),

            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter item description",
              ),
              style: const TextStyle(fontFamily: "SourGummy" ,),
            ),

            const SizedBox(height: 16),

            const Text("Status (Lost/Found):", style: TextStyle(fontFamily: "SourGummy" ,fontSize: 18, fontWeight: FontWeight.bold)),

            TextField(
              controller: _statusController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter status",
              ),
              style: const TextStyle(fontFamily: "SourGummy" ,),
            ),

            const SizedBox(height: 16),

            const Text("Date:", style: TextStyle(fontFamily: "SourGummy" , fontSize: 18, fontWeight: FontWeight.bold)),

            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter date (e.g., 22-11-2024)",
              ),
              style: const TextStyle(fontFamily: "SourGummy" ,),
            ),

            const SizedBox(height: 16),

            Center(
              child: Column(
                children: [
                  if (_selectedImage != null)
                    Image.file(_selectedImage!, height: 200),

                  const SizedBox(height: 10),

                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.upload_file),
                    label: const Text("Select Image" , style: TextStyle(),),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: save,
                child: const Text("Save Item"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
