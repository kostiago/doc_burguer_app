import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:doc_burguer_app/app/core/extensions/formatter_extension.dart';
import 'package:doc_burguer_app/app/core/ui/helpers/size_extensions.dart';
import 'package:doc_burguer_app/app/core/ui/styles/text_styles.dart';
import 'package:doc_burguer_app/app/core/ui/widget/delivery_appbar.dart';
import 'package:doc_burguer_app/app/dto/order_product_dto.dart';
import 'package:doc_burguer_app/app/models/product_model.dart';
import 'package:doc_burguer_app/app/pages/home/widget/delivery_increment_decrement.dart';
import 'package:doc_burguer_app/app/pages/product_detail/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/base_state/base_state.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  final OrderProductDto? order;
  const ProductDetailPage({
    super.key,
    required this.product,
    required this.order,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailPage, ProductDetailController> {
  @override
  void initState() {
    super.initState();
    final amount = widget.order?.amount ?? 1;
    controller.initial(amount, widget.order != null);
  }

  void _showDeleteConfirm(int amount) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.topSlide,
      title: 'Atenção',
      desc: 'Deseja excluir esse produto?',
      btnCancel: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          'Cancelar',
          style: context.textStyles.textBold.copyWith(color: Colors.red),
        ),
      ),
      btnOk: TextButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.of(context).pop(
            OrderProductDto(
              product: widget.product,
              amount: amount,
            ),
          );
        },
        child: Text('Confirmar', style: context.textStyles.textBold),
      ),
    )..show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(.4),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              widget.product.name,
              style: context.textStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SingleChildScrollView(
                child: Text(
                  widget.product.description,
                  style: context.textStyles.textRegular.copyWith(fontSize: 16),
                ),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Container(
                  width: context.percentWidth(.5),
                  height: 70,
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<ProductDetailController, int>(
                      builder: (context, amount) {
                    return DeliveryIncrementDecrement(
                      decrementTap: () {
                        controller.decrement();
                      },
                      incrementTap: () {
                        controller.icrement();
                      },
                      amount: amount,
                    );
                  })),
              Container(
                  width: context.percentWidth(.5),
                  height: 70,
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amount) {
                      return ElevatedButton(
                        style: amount == 0
                            ? ElevatedButton.styleFrom(
                                backgroundColor: Colors.red)
                            : null,
                        onPressed: () {
                          if (amount == 0) {
                            _showDeleteConfirm(amount);
                          } else {
                            Navigator.of(context).pop(
                              OrderProductDto(
                                product: widget.product,
                                amount: amount,
                              ),
                            );
                          }
                        },
                        child: Visibility(
                          visible: amount > 0,
                          replacement: Text(
                            'Excluir Produto',
                            style: context.textStyles.textExtraBold,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Adicionar',
                                style: context.textStyles.textExtraBold
                                    .copyWith(fontSize: 13),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  (widget.product.price * amount).currencyPTBR,
                                  maxFontSize: 13,
                                  minFontSize: 5,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: context.textStyles.textExtraBold,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ))
            ],
          )
        ],
      ),
    );
  }
}
