import 'package:flutter/material.dart';

class CarouselItem {
  final Image image;
  final String? label;
  final VoidCallback? onTap;

  CarouselItem({
    required this.image,
    this.label,
    this.onTap,
  });
}

class Carousel extends StatefulWidget {
  const Carousel({
    super.key,
    this.height = 300,
    required this.items,
    this.showPages = true,
    this.chipColor = Colors.white,
    this.fit = BoxFit.cover,
    this.textColor = Colors.black,
  });

  final double height;
  final bool showPages;
  final Color chipColor;
  final Color textColor;
  final BoxFit fit;
  final List<CarouselItem> items;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  String? indexLabel;

  late int numPage;

  @override
  void initState() {
    super.initState();
    numPage = 1;

    if (widget.items[0].label != null) {
      indexLabel = widget.items[0].label!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index < widget.items.length &&
                    widget.items[index].label != null) {
                  indexLabel = widget.items[index].label!;
                } else {
                  indexLabel = null;
                }
                return GestureDetector(
                  onTap: widget.items[index].onTap,
                  child: FittedBox(
                      fit: widget.fit, child: widget.items[index].image),
                );
              },
              itemCount: widget.items.length,
              onPageChanged: (value) {
                setState(
                  () {
                    indexLabel;
                    numPage = value + 1;
                  },
                );
              },
            ),
          ),
          if (indexLabel != null)
            Positioned(
              bottom: 5,
              left: 5,
              child: Chip(
                backgroundColor: widget.chipColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                label: Text(
                  indexLabel!,
                  style: TextStyle(
                    color: widget.textColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          if (widget.showPages)
            Positioned(
              bottom: 5,
              right: 5,
              child: Chip(
                backgroundColor: widget.chipColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                label: Text(
                  '$numPage/${widget.items.length}',
                  style: TextStyle(
                    color: widget.textColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
