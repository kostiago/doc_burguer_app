import 'package:doc_burguer_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../core/ui/clipper/clipper.dart';
import '../../core/ui/clipper/clipper_two.dart';
import '../../core/ui/widget/delivery_button.dart';

class SiginPage extends StatelessWidget {
  const SiginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPassword = TextEditingController();
    var nameController = TextEditingController();

    //NAME
    Widget _buildName() {
      return Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 6,
            color: Colors.grey.shade400,
          ),
        ]),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Digite seu Nome';
            }
          },
          controller: nameController,
          decoration: const InputDecoration(
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.person),
              labelText: 'Nome *',
              hintText: 'Digite seu Nome'),
        ),
      );
    }

    //EMAIL
    Widget _buildEmail() {
      return Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 6,
            color: Colors.grey.shade400,
          ),
        ]),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Digite seu Email';
            }
          },
          controller: emailController,
          decoration: const InputDecoration(
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'E-mail *',
              hintText: 'Digite seu E-mail'),
        ),
      );
    }

    //PASSWORD
    Widget _buildPassword() {
      return Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 6,
            color: Colors.grey.shade400,
          ),
        ]),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Digite sua senha';
            }
          },
          controller: passwordController,
          decoration: const InputDecoration(
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.lock_outline_rounded),
              labelText: 'Senha *',
              hintText: 'Digite sua senha'),
        ),
      );
    }

    //CONFIRM PASSWORD
    Widget _buildConfirmPassword() {
      return Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 6,
            color: Colors.grey.shade400,
          ),
        ]),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Confirme sua senha';
            }
          },
          controller: confirmPassword,
          decoration: const InputDecoration(
              disabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(Icons.lock_outline_rounded),
              labelText: 'Confirmar Senha *',
              hintText: 'Digite sua senha novamente'),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(
                  children: [
                    CustomPaint(
                      size: Size(MediaQuery.of(context).size.width, 300),
                      painter: RPSCustomPainter(),
                    ),
                    Positioned(
                      top: 16,
                      right: -5,
                      child: CustomPaint(
                        size: Size(MediaQuery.of(context).size.width, 300),
                        painter: PSCustomPainter(),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cadastro',
                            style: context.textStyles.textExtraBold
                                .copyWith(fontSize: 26),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Preencha todos os campos para realizar\n o cadastro.',
                            style: context.textStyles.textLight
                                .copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 25),
                      _buildName(),
                      const SizedBox(height: 20),
                      _buildEmail(),
                      const SizedBox(height: 20),
                      _buildPassword(),
                      const SizedBox(height: 20),
                      _buildConfirmPassword(),
                      const SizedBox(height: 20),
                      DeliveryButton(
                        label: 'CADASTRAR',
                        onPressed: () {},
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já possui conta ?',
                      style: context.textStyles.textBold,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/auth/login');
                        },
                        child: Text(
                          'Conectse-se',
                          style: context.textStyles.textBold
                              .copyWith(color: Colors.blue),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
