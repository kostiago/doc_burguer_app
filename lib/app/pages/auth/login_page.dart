import 'package:doc_burguer_app/app/core/ui/clipper/clipper.dart';
import 'package:doc_burguer_app/app/core/ui/styles/text_styles.dart';

import 'package:doc_burguer_app/app/core/ui/widget/delivery_button.dart';
import 'package:flutter/material.dart';

import '../../core/ui/clipper/clipper_two.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    Widget _buildEmail() {
      return Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: const Offset(3, 3),
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
              prefixIcon: Icon(Icons.lock_outline_rounded),
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
            offset: const Offset(3, 3),
            blurRadius: 6,
            color: Colors.grey.shade400,
          ),
        ]),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Digite sua Senha';
            }
          },
          controller: passwordController,
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email_outlined,
              ),
              labelText: 'Senha *',
              hintText: 'Digite sua Senha'),
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
                            'Login',
                            style: context.textStyles.textExtraBold
                                .copyWith(fontSize: 26),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Para continuar faça seu login.',
                            style: context.textStyles.textLight
                                .copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      _buildEmail(),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildPassword(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Esqueceu sua senha?',
                        style: context.textStyles.textBold.copyWith(
                          fontSize: 13,
                          color: const Color(0xffFCA148),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DeliveryButton(
                        label: 'ENTRAR',
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
                      'Não possui conta ?',
                      style: context.textStyles.textBold,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/auth/register');
                        },
                        child: Text(
                          'Cadastre-se',
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
