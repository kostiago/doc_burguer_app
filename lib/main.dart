import 'package:doc_burguer_app/app/core/config/env/env.dart';
import 'package:doc_burguer_app/app/seu_burguer.dart';
import 'package:flutter/material.dart';

void main() async {
  await Env.i.load();
  runApp(const SeuBurguer());
}
