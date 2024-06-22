import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:smart_cafeteria/model/test_model/item_info.dart';

class ItemCardGridView extends StatelessWidget {
  const ItemCardGridView({
    super.key,
    required this.item_,
  });

  final MyItemInfo item_;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      // splashColor: Theme.of(context).colorScheme.secondaryFixedDim,
      // radius: 50,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Ink(
        decoration: BoxDecoration(
          // border: Border.all(color: Theme.of(context).colorScheme.outlineVariant,width: 2),
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
                  child: AspectRatio(
                    aspectRatio: 1.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item_.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    item_.name.toCapitalCase(),
                    // style: GoogleFonts.poppins(fontSize: 17, color: Theme.of(context).colorScheme.onSecondaryContainer, fontWeight: FontWeight.w500,),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          // fontSize: 18,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        "KCal: ${item_.kcal} ",
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                  fontWeight: FontWeight.w100,
                                ),
                      ),
                      Icon(
                        Icons.local_fire_department_outlined,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        size: Theme.of(context).textTheme.labelMedium?.fontSize,
                        // weight: 123,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "TK. ${item_.price}",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          // fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            const Positioned(
              top: 2,
              right: 1,
              child: FavoriteIconButton(),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton.outlined(
                onPressed: () {},
                tooltip: "Add To Cart",
                style: IconButton.styleFrom(
                  // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  padding: const EdgeInsets.all(4),
                  minimumSize: const Size.square(30),
                  maximumSize: const Size.square(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  side: BorderSide(
                    width: 2,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteIconButton extends StatefulWidget {
  const FavoriteIconButton({super.key});

  // final bool isFavorite = false;

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  bool favorite_ = false;
  // _FavoriteIconButtonState({
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
      style: IconButton.styleFrom(
        padding: const EdgeInsets.all(7),
        minimumSize: const Size.square(30),
        maximumSize: const Size.square(50),
      ),
      icon: Icon(
        favorite_ ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        color: Theme.of(context).colorScheme.error,
        size: 20,
      ),
    );
  }
}
