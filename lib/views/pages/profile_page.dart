import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: AppColors.bgColor,
        ),
        body: ListView(
          children: [
            GestureDetector(
              onTap: () {
                debugPrint('Profile image tapped');
              },
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/myProfileImage.jpg'),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text('Obada Daghlas',
                            style: Theme.of(context).textTheme.headlineLarge),
                        Text('0594*****9',
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            buildListTile(context, Icons.person, 'Edit Profile', () {
              debugPrint('Edit Profile tapped');
            }),
            buildListTile(context, Icons.shopping_cart, 'Orders', () {
              debugPrint('Orders tapped');
            }),
            buildListTile(context, Icons.settings, 'Settings', () {
              debugPrint('Settings tapped');
            }),
            buildListTile(context, Icons.logout, 'Logout', () {
              debugPrint('Logout tapped');
            }),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
                onPressed: () => showCallUsModal(context),
                child: const Icon(Icons.phone)),
            const SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () => showEmailFormModal(context),
              child: const Icon(Icons.email),
            ),
          ],
        ));
  }

  Widget buildListTile(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.15),
          ),
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).primaryColor.withOpacity(0.15),
        ),
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          onTap: onTap,
          trailing: const Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }

  void showCallUsModal(BuildContext context) {
    const String phoneNumber = "0594*****6";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Call Us"),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.phone, size: 48),
              Text("Contact us at: $phoneNumber"),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Clipboard.setData(const ClipboardData(text: phoneNumber))
                    .then((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Phone number copied to clipboard!"),
                    ),
                  );
                });
              },
              child: const Text("Copy Number"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  void showEmailFormModal(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String emailReason = 'Report'; // Default value
    String emailContent = '';

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: <Widget>[
                  DropdownButtonFormField<String>(
                    value: emailReason,
                    onChanged: (String? newValue) {
                      emailReason = newValue!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Reason for Email',
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(color: AppColors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: AppColors.grey2),
                      ),
                    ),
                    items: <String>['Report', 'Ordering', 'Some Issues']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20), // Add space between input fields
                  TextFormField(
                    maxLines: 3,
                    onChanged: (value) => emailContent = value,
                    decoration: InputDecoration(
                      labelText: 'Email Content',
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            const BorderSide(color: AppColors.grey, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(color: AppColors.grey2, width: 2.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.white, 
                      backgroundColor:
                          Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    child: const Text('Send Email'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
