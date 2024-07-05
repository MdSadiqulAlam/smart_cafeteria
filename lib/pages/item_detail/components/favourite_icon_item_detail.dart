import 'package:flutter/material.dart';

class FavoriteIconButtonItemDetail extends StatefulWidget {
  const FavoriteIconButtonItemDetail({super.key});

  // final bool isFavorite = false;
  @override
  State<FavoriteIconButtonItemDetail> createState() => _FavoriteIconButtonItemDetailState();
}

class _FavoriteIconButtonItemDetailState extends State<FavoriteIconButtonItemDetail> {
  bool favorite_ = false;

  // _FavoriteIconButtonItemDetailState({
  //   required this.favorite_,
  // });

  void _toggleFavorite() {
    setState(() {
      favorite_ = !favorite_;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: _toggleFavorite,
      tooltip: "Add To Favorites",
      icon: Icon(
        favorite_ ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        color: Theme.of(context).colorScheme.error,
        size: favorite_ ? 24 : 21,
      ),
    );
  }
}