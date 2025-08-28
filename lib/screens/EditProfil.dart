import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController(text: "Moise");
  TextEditingController lastNameController = TextEditingController(text: "ATINANG");
  TextEditingController phoneController = TextEditingController(text: "+237 653 51 38 94");
  TextEditingController dobController = TextEditingController(text: "15/5/1990");
  TextEditingController bioController = TextEditingController(
      text: "Passionate learner and tech enthusiast. Always eager to explore new technologies and expand my knowledge.");

  String gender = "Male";
  String country = "Cameroon";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text("Edit Profile",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Sauvegarde ici
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Profile updated ✅")),
                );
                Navigator.pop(context);
              }
            },
            child: const Text("Save",
                style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold)),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text("Personal Information",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: const InputDecoration(
                        labelText: "First Name",
                        prefixIcon: Icon(Icons.person_outline, color: Colors.lightBlue),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: const InputDecoration(
                        labelText: "Last Name",
                        prefixIcon: Icon(Icons.person_outline, color: Colors.lightBlue),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone, color: Colors.lightBlue),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: dobController,
                decoration: const InputDecoration(
                  labelText: "Date of Birth",
                  prefixIcon: Icon(Icons.calendar_today, color: Colors.lightBlue),
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(1990, 5, 15),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      dobController.text =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    });
                  }
                },
              ),
              const SizedBox(height: 12),
              
              DropdownButtonFormField<String>(
                value: gender,
                items: ["Male", "Female"].map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    gender = val!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Gender",
                  prefixIcon: Icon(Icons.person, color: Colors.lightBlue),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                value: country,
                items: ["Cameroon", "Nigeria", "Gabon", "Tchad", "Senegal"].map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    country = val!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Country",
                  prefixIcon: Icon(Icons.flag, color: Colors.lightBlue),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: bioController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Bio",
                  prefixIcon: Icon(Icons.info_outline, color: Colors.lightBlue),
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
