import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class AlertCategory extends StatefulWidget {
  @override
  State<AlertCategory> createState() => _AlertCategoryState();
}

class _AlertCategoryState extends State<AlertCategory> {
  Uint8List? categoryImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Builder Example')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Creating a new category",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Category name",
                    style: TextStyle(fontSize: 20),
                  ),
                  FormBuilderTextField(
                    name: "Category name",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Category description",
                    style: TextStyle(fontSize: 20),
                  ),
                  FormBuilderTextField(name: "Category Description"),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Visibility",
                    style: TextStyle(fontSize: 20),
                  ),
                  FormBuilderSwitch(
                      initialValue: true,
                      name: "Visibility",
                      title: Text("Visibility")),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Category image"),
                  SizedBox(
                    height: 15,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: InkWell(
                      onTap: () async {
                        var result = await FilePicker.platform.pickFiles(
                            type: FileType.image, allowMultiple: false);
                        if (result?.files.first != null) {
                          categoryImage = result?.files.first.bytes;
                          setState(() {});
                        }
                      },
                      child: categoryImage != null
                          ? Image.memory(
                              categoryImage!,
                              height: 100.0,
                              width: 100.0,
                              fit: BoxFit.cover,
                            )
                          : Icon(Icons.broken_image_rounded, size: 100),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton.extended(
                      label: Text("Create"), onPressed: () {})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
