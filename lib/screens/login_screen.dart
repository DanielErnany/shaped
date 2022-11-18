import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();

  final _senhaFocusNode = FocusNode();

  bool _isIncorretoEmailSenha = false;

  final _formData = <String, String>{};

  bool _autovalidateMode = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _senhaFocusNode.dispose();
  }

  Future<void> _saveForm() async {
    setState(() {
      _isIncorretoEmailSenha = false;
    });
    final isValid = _form.currentState!.validate();

    if (!isValid) {
      setState(() {
        _autovalidateMode = true;
      });
      return;
    }

    _form.currentState?.save();
    String email = _formData['email']!;

    String senha = _formData['senha']!;

    if (email == 'shaped3D@shaped.com' || senha == 'shaped123') {
// TODO EFETUAR LOGIN
    } else {
      setState(() {
        _isIncorretoEmailSenha = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dimensionsDevice = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: dimensionsDevice.width * 0.03,
            ),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: dimensionsDevice.width * 0.03,
                  vertical: dimensionsDevice.height * 0.02,
                ),
                child: Column(
                  children: [
                    Form(
                      key: _form,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text('Email'),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textCapitalization: TextCapitalization.none,
                            textInputAction: TextInputAction.next,
                            autovalidateMode: _autovalidateMode
                                ? AutovalidateMode.onUserInteraction
                                : null,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Preencha o email";
                              }

                              return null;
                            },
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_senhaFocusNode);
                            },
                            onChanged: (_) {
                              if (_isIncorretoEmailSenha) {
                                setState(() {
                                  _isIncorretoEmailSenha = false;
                                });
                              }
                            },
                            onSaved: (value) =>
                                _formData['email'] = value ?? '',
                          ),
                          SizedBox(height: dimensionsDevice.height * 0.02),
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text('Senha'),
                            ),
                            obscureText: true,
                            autovalidateMode: _autovalidateMode
                                ? AutovalidateMode.onUserInteraction
                                : null,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Preencha a senha";
                              }

                              return null;
                            },
                            focusNode: _senhaFocusNode,
                            onSaved: (value) =>
                                _formData['senha'] = value ?? '',
                            onChanged: (_) {
                              if (_isIncorretoEmailSenha) {
                                setState(() {
                                  _isIncorretoEmailSenha = false;
                                });
                              }
                            },
                            onFieldSubmitted: (_) {
                              _saveForm();
                            },
                          ),
                          if (_isIncorretoEmailSenha)
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: dimensionsDevice.height * 0.02,
                                  ),
                                  child: const Text(
                                    'Email ou senha incorretos!',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: dimensionsDevice.height * 0.01),
                    ElevatedButton.icon(
                      onPressed: _saveForm,
                      icon: const Icon(Icons.login),
                      label: const Text('Login'),
                    )
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
