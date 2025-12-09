import 'package:flutter/material.dart';
import 'package:testing/view/login.dart';
import 'package:testing/comp/form.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController notelpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputF(
                (p0){
                if(p0 == null || p0.isEmpty)
                {
                  return 'Username Tidak Boleh Kosong!';
                }
                if(p0.toLowerCase() == 'asu'){
                  return 'Rasah Misuh COK!';
                }
                return null;
                }, 
                controller: usernameController, 
                hint: "Username", 
                helper: "Masukkin nama", 
                iconData: Icons.person),
              inputF(
                ((p0){
                  if(p0 == null || p0.isEmpty)
                  {
                    return 'Email e ojo kosong bro!';
                  }
                  if(!p0.contains('@')){
                    return 'Email opo huduk to jano? kok raono @ e...';
                  }
                  return null;
                }),
                controller: emailController,
                hint: "Email",
                helper: "Email Jangan Lupa Masukkin Boss...",
                iconData: Icons.email),
              inputF(
                ((p0){
                  if(p0 == null || p0.isEmpty)
                  {
                    return 'Password e ojok dikosongi COK!';
                  }
                  if(p0.length<5)
                  {
                    return 'Iki Password opo e??... cendhek temen...';
                  }
                }), 
                controller: passwordController, 
                hint: "Password", 
                helper: "Lebokne Password e yo...", 
                iconData: Icons.password,
                password: true),
              inputF(
                ((p0){
                  if(p0 == null || p0.isEmpty)
                  {
                    return 'Nomor Telpon OJO DIKOSONGI BRO!';
                  }
                  return null;
                }), 
                controller: notelpController, 
                hint: "Telpon", 
                helper: "Lebokke nomor e bro... ojo stecu ae...", 
                iconData: Icons.phone_android),
              ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    Map<String,dynamic> formData = {};
                    formData['username'] = usernameController.text;
                    formData['password'] = passwordController.text;

                    Navigator.push(context, MaterialPageRoute(builder:(_) => LoginView(data: formData, )) );
                  }
                }, 
                child: const Text('Register'))
            ],
          ),
        )),
    );
  }
}