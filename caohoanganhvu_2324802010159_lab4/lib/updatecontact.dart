import 'package:caohoanganhvu_2324802010159_lab4/controllers/crud_services.dart';
import 'package:caohoanganhvu_2324802010159_lab4/model.dart';
import 'package:flutter/material.dart';

class UpdateContactPage extends StatefulWidget {
  const UpdateContactPage({super.key});

  @override
  State<UpdateContactPage> createState() => _UpdateContactPageState();
}

class _UpdateContactPageState extends State<UpdateContactPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  late final CRUDModel contact;
  bool _isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_isLoaded) return;

    contact = ModalRoute.of(context)!.settings.arguments as CRUDModel;
    _nameController.text = contact.name ?? '';
    _phoneController.text = contact.phone ?? '';
    _emailController.text = contact.email ?? '';
    _isLoaded = true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Contact',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  try {
                    if (_formkey.currentState!.validate()) {
                      CrudServices().updateContact(
                        contact.id,
                        _nameController.text,
                        _phoneController.text,
                        _emailController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Contact updated successfully')),
                      );
                      Navigator.pushReplacementNamed(context, "/home");
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to update contact: $e')),
                    );
                  }
                },
                child: Text('Update'),
              ),
              SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  try {
                    if (_formkey.currentState!.validate()) {
                      CrudServices().deleteContact(contact.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Contact deleted successfully')),
                      );
                      Navigator.pushReplacementNamed(context, "/home");
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to delete contact: $e')),
                    );
                  }
                },
                child: Text('Delete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
