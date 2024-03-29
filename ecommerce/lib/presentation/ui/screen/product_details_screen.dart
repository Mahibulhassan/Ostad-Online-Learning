import 'package:ecommerce/data/models/product_details.dart';
import 'package:ecommerce/presentation/state_holders/add_to_cart_controller.dart';
import 'package:ecommerce/presentation/state_holders/product_details_controller.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_stepper.dart';
import 'package:ecommerce/presentation/ui/widgets/home/product_image_slider.dart';
import 'package:ecommerce/presentation/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/colour_extensions.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
            if (productDetailsController.getProductDetailsInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ProductImageSlider(
                                imageList: [
                                  productDetailsController.productDetails.img1 ?? '',
                                  productDetailsController.productDetails.img2 ?? '',
                                  productDetailsController.productDetails.img3 ?? '',
                                  productDetailsController.productDetails.img4 ?? '',
                                ],
                              ),
                              productDetailsAppBar,
                            ],
                          ),
                          productDetails(productDetailsController.productDetails,
                              productDetailsController.availableColors),
                        ],
                      ),
                    ),
                  ),
                  cartToCartBottomContainer(
                    productDetailsController.productDetails,
                    productDetailsController.availableColors,
                    productDetailsController.availableSizes,
                  ),
                ],
              ),
            );
          }
      ),
    );
  }

  Padding productDetails(ProductDetails productDetails, List<String> colors) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                    productDetails.product?.title ?? '',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5),
                  )),
              CustomStepper(
                  lowerLimit: 1,
                  upperLimit: 10,
                  stepValue: 1,
                  value: 1,
                  onChange: (newValue) {
                    print(newValue);
                  })
            ],
          ),
          Row(
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.amber,
                  ),
                  Text(
                    '${productDetails.product?.star ?? 0}',
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Review',
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Card(
                color: AppColors.primaryColor,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const Text(
            'Color',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 28,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              itemBuilder: (context, index) {
                print(colors[index]);
                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    _selectedColorIndex = index;
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: HexColor.fromHex(colors[index]),
                    child: _selectedColorIndex == index
                        ? const Icon(
                      Icons.done,
                      color: Colors.white,
                    )
                        : null,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 8,
                );
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Size',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 28,
            child: SizedBox(
              height: 28,
              child: SizePicker(
                initialSelected: 0,
                onSelected: (int selectedSize) {
                  _selectedSizeIndex = selectedSize;
                },
                sizes: productDetails.size?.split(',') ?? [],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(productDetails.des ?? ''),
        ],
      ),
    );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      leading: const BackButton(
        color: Colors.black54,
      ),
      title: const Text(
        'Product details',
        style: TextStyle(color: Colors.black54),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Container cartToCartBottomContainer(ProductDetails details, List<String> colors, List<String> sizes) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price', style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black54
              ),),
              SizedBox(height: 4,),
              Text('\$1000', style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.primaryColor
              ),),
            ],
          ),
          SizedBox(
            width: 120,
            child: GetBuilder<AddToCartController>(
                builder: (addToCartController) {
                  if (addToCartController.addToCartInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ElevatedButton(
                    onPressed: () async {
                      final result = await addToCartController.addToCart(
                        details.id!,
                        colors[_selectedColorIndex].toString(),
                        sizes[_selectedSizeIndex],
                      );
                      if (result) {
                        Get.snackbar('Added to cart',
                            'This product has been added to cart list',
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                    child: const Text('Add to cart'),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
