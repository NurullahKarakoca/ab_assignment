import 'package:ab_assignment/utils/dimen.dart';
import 'package:ab_assignment/view_models/authentication_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(paddingSize),
      child: Column(
        children: [
          Center(
            child: Text(
              "Nurullah Karakoca",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          const SizedBox(
            height: paddingSize,
          ),
          const ListTile(
            title: Text("Ayarlar"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          const ListTile(
            title: Text("Cihaz Yönetimi"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          ListTile(
            title: Text("Çıkış Yap"),
            onTap: () {
              context.read<AuthenticationViewModel>().logout();
            },
          )
        ],
      ),
    );
  }
}
