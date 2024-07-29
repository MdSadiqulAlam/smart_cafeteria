import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smart_cafeteria/config/get_config.dart';

class AddToCartSegment extends StatefulWidget {
  const AddToCartSegment({super.key});

  @override
  State<AddToCartSegment> createState() => _AddToCartSegmentState();
}

class _AddToCartSegmentState extends State<AddToCartSegment> {
  int itemCount = 1;
  bool addingToCart = false;

  void _updateItemCount(int val) {
    setState(() {
      itemCount += val;
      itemCount = itemCount < 1 ? 1 : itemCount;
    });
  }

  void _addToCart() async {
    if (!addingToCart) {
      setState(() {
        addingToCart = true;
      });
      await Future.delayed(const Duration(milliseconds: 2000), () {});
      setState(() {
        addingToCart = false;
        itemCount = 1;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Item Added to Cart"), duration: Duration(milliseconds: 700)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: addingToCart
            ? FilledButton.tonal(
                key: const ValueKey<bool>(true),
                onPressed: _addToCart,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                  child: LoadingAnimationWidget.fourRotatingDots(
                    color: getColorScheme(context).onSecondaryContainer,
                    size: 29,
                  ),
                ),
              )
            : Row(
                key: const ValueKey<bool>(false),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _updateItemCount(1);
                    },
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            _updateItemCount(-1);
                          },
                        ),
                        Text("$itemCount", style: const TextStyle(fontSize: 20)),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            _updateItemCount(1);
                          },
                        ),
                      ],
                    ),
                  ),
                  FilledButton.tonal(
                    onPressed: _addToCart,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                      child: Text("Add To Cart", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
