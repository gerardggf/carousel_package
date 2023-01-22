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
    this.physics = const BouncingScrollPhysics(),
    this.arrowColor = Colors.white,
    this.canSwipe = true,
    this.textStyle,
  });

  final double height;
  final bool showPages;
  final Color chipColor;
  final Color arrowColor;
  final Color textColor;
  final BoxFit fit;
  final ScrollPhysics physics;
  final bool canSwipe;
  final List<CarouselItem> items;
  final TextStyle? textStyle;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  String? indexLabel;

  late double numPage;

  final PageController _pageController = PageController();

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
              controller: _pageController,
              physics: widget.canSwipe
                  ? widget.physics
                  : const NeverScrollableScrollPhysics(),
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
                    fit: widget.fit,
                    child: widget.items[index].image,
                  ),
                );
              },
              itemCount: widget.items.length,
              onPageChanged: (value) {
                numPage = _pageController.page!.round() + 1;
                setState(() {});
              },
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                previousPage();
                numPage = _pageController.page!.round() + 1;
                setState(() {});
              },
              icon: Icon(
                Icons.keyboard_arrow_left_outlined,
                color: widget.arrowColor,
                size: 50,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                nextPage();
                numPage = _pageController.page!.round() + 1;
                setState(() {});
              },
              icon: Icon(
                Icons.keyboard_arrow_right_outlined,
                color: widget.arrowColor,
                size: 50,
              ),
            ),
          ),
          if (indexLabel != null)
            Positioned(
              bottom: 5,
              left: 5,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  color: widget.chipColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  indexLabel!,
                  style: widget.textStyle ??
                      TextStyle(
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
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  color: widget.chipColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  '${numPage.toInt()}/${widget.items.length}',
                  style: widget.textStyle ??
                      TextStyle(
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

  void nextPage() {
    if (_pageController.page!.toInt() < widget.items.length - 1) {
      _pageController.animateToPage(
        _pageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
      numPage = _pageController.page!.round() + 1;
      setState(() {});
    }
  }

  void previousPage() {
    if (_pageController.page!.toInt() != 0) {
      _pageController.animateToPage(
        _pageController.page!.toInt() - 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
      numPage = _pageController.page!.round() + 1;
      setState(() {});
    }
  }
}
