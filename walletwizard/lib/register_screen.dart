import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String name = '';
  String email = '';
  String password = '';
  bool isLoading = false;

  void register() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    _formKey.currentState!.save();
    setState(() => isLoading = true);

    try {
      // Registro en Firebase Auth
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Guardar en Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'createdAt': Timestamp.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registro exitoso')),
      );

      Navigator.of(context).pop(); // Regresa a login o home

    } on FirebaseAuthException catch (e) {
      final msg = e.message ?? 'Error desconocido';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Crear cuenta', style: Theme.of(context).textTheme.titleLarge),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nombre completo'),
                      validator: (value) => value == null || value.trim().length < 2
                          ? 'Ingresa un nombre válido'
                          : null,
                      onSaved: (value) => name = value!.trim(),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Correo electrónico'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          value != null && value.contains('@') ? null : 'Correo inválido',
                      onSaved: (value) => email = value!.trim(),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Contraseña'),
                      obscureText: true,
                      validator: (value) =>
                          value != null && value.length >= 6
                              ? null
                              : 'La contraseña debe tener al menos 6 caracteres',
                      onSaved: (value) => password = value!.trim(),
                    ),
                    SizedBox(height: 16),
                    isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: register,
                            child: Text('Registrarse'),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
