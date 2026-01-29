import 'package:day9_database_auth_girl/extension/nav.dart';
import 'package:day9_database_auth_girl/service/database.dart';
import 'package:day9_database_auth_girl/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var titleController = TextEditingController();
  var imageController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: SafeArea(
        child: FutureBuilder(
          future: Database().getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final course = snapshot.data![index];
                return Card(
                  child: Column(
                    children: [
                      Image.network(course.image!),
                      Text(course.title!),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("add new course", style: TextStyle(fontSize: 24)),
                      SizedBox(height: 24),
                      TextFieldWidget(
                        controller: titleController,
                        hint: "title",
                        icon: Icon(Icons.title),
                      ),
                      SizedBox(height: 24),
                      TextFieldWidget(
                        controller: imageController,
                        hint: "image",
                        icon: Icon(Icons.image),
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () async {
                          if (titleController.text.isValidText) {
                            await Database().addCourse(
                              image: imageController.text,
                              title: titleController.text,
                            );
                            imageController.clear();
                            titleController.clear();
                            setState(() {});
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Add"),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
