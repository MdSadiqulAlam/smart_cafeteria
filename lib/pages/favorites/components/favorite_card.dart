import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';

import '../../../model/test_model/item_info.dart';
import '../../item_detail/item_detail.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.item_,
  });

  final MyItemInfo item_;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetail(item_: item_),
          ),
        );
      },
      borderRadius: BorderRadius.circular(17),
      child: Ink(
        // height: cardHeight,
        decoration: BoxDecoration(
          // border: Border.all(color: Theme.of(context).colorScheme.outlineVariant,width: 2),
          borderRadius: BorderRadius.circular(17),
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        item_.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      item_.name.toCapitalCase(),
                      // style: GoogleFonts.poppins(fontSize: 17, color: Theme.of(context).colorScheme.onSecondaryContainer, fontWeight: FontWeight.w500,),
                      style:
                      Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "KCal: ${item_.kcal} ",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                        Icon(
                          Icons.local_fire_department_outlined,
                          color: Theme.of(context).colorScheme.outline,
                          size:
                          Theme.of(context).textTheme.labelLarge?.fontSize,
                          // weight: 123,
                        ),
                        Text(
                          " . sold:${item_.itemSold}",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        item_.itemDetail,
                        style:
                        Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "TK. ${item_.price}",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer,
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Positioned(
              top: 0,
              right: 0,
              child: FavoriteIconButton(),
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
  bool favorite_ = true;

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
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer),
      icon: Icon(
        favorite_ ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        color: Theme.of(context).colorScheme.error,
        size: favorite_ ? 21 : 18,
      ),
    );
  }
}