import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
    this.height = 200,
    required this.images,
    this.label,
  });

  final double height;
  final List<String?>? label;
  final List<Image> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: 4 / 3,
            child: Stack(
              children: [
                Positioned.fill(
                  child: images[index],
                ),
                if (label != null &&
                    index == label!.length &&
                    label![index] != null)
                  Positioned(
                    child: Container(
                      color: Colors.white10,
                      child: Text(
                        label![index]!,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
        itemCount: images.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 5,
          );
        },
      ),
    );
  }
}
