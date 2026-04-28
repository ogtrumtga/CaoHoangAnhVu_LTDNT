import 'package:caohoanganhvu_2324802010159_lab4/controllers/auth_services.dart';
import 'package:caohoanganhvu_2324802010159_lab4/view_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ViewModel viewModel = ViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchContacts().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacts',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 100,
              child: const DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.orange),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                AuthServices().logout().then((value) {
                  Navigator.pushReplacementNamed(context, "/login");
                });
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: viewModel.contact.length,
                itemBuilder: (context, index) {
                  final contact = viewModel.contact[index];
                  final name = contact.name ?? '';
                  final phone = contact.phone ?? '';
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(name.isNotEmpty ? name[0].toUpperCase() : ''),
                    ),
                    title: Text(name),
                    subtitle: Text(phone),
                    trailing: Icon(Icons.phone),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/updatecontact",
                        arguments: contact,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/addcontact");
        },
        child: Icon(Icons.person_add),
      ),
    );
  }
}
