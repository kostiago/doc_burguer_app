import 'package:doc_burguer_app/app/core/extensions/formatter_extension.dart';
import 'package:doc_burguer_app/app/core/ui/styles/colors_app.dart';
import 'package:doc_burguer_app/app/core/ui/styles/text_styles.dart';
import 'package:doc_burguer_app/app/dto/order_product_dto.dart';
import 'package:doc_burguer_app/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel product;
  final OrderProductDto? orderProductDto;

  const DeliveryProductTile({
    super.key,
    required this.product,
    required this.orderProductDto,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final controller = context.read<HomeController>();
        final orderProduct =
            await Navigator.of(context).pushNamed('/productDetail', arguments: {
          'product': product,
          'order': orderProductDto,
        });

        if (orderProduct != null) {
          controller.addOrUpdateBag(orderProduct as OrderProductDto);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.name,
                      style: context.textStyles.textExtraBold
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.description,
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.price.currencyPTBR,
                      style: context.textStyles.textLight.copyWith(
                        fontSize: 12,
                        color: context.colors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: product.image,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
