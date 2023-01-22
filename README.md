<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Customizable carousel to be able to slide between images, see information about them and be able to carry out an action by clicking on them.

## Features

The parameters that can be passed to the Carousel Widget are the following:
 <br>- (double) height: Widget height.
 <br>- (bool) showPages: Defines whether or not to show a chip with the current page number and the total number of pages.
 <br>- (Color) chipColor: Defines the color of the chip that contains texts.
 <br>- (Color) arrowColor: Defines the color of the side arrows to change from one image to another.
 <br>- (Color) textColor: Defiens the color of the texts.
 <br>- (BoxFit) fit: Defines how you want to fit the image within the available space of the widget.
 <br>- (ScrollPhysics) physics: Define the type of physics you want to apply when moving between images.
 <br>- (bool) canSwipe: Defines if the screen can be swiped or if can only be moved using the side arrows buttons.
 <br>- (TextStyle?) textStyle: Defines the text format of the page number and label chips.
 <br>- (List>CarouselItem<) items: Only mandatory parameter, to which at least one instance of the CarouselItem class must be passed.

Within the CarrouselItem class you can pass the following parameters:
 <br>- (Image) image: Image to be displayed.
 <br>- (String?) label: Short description that can be added to the image.
 <br>- (VoidCallback?) onTap: Function to be performed if the displayed image is clicked.

## Getting started

Install the package using the command in the Installing section and it can now be used.

## Usage

An example of the application can be found in the `/example` folder.

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const Text('Text 1'),
            Carousel(
              items: [
                CarouselItem(
                  image: Image.network(
                    'https://www.gstatic.com/webp/gallery/1.jpg',
                  ),
                  label: 'Image 1',
                  onTap: () {
                    if (kDebugMode) {
                      print('1');
                    }
                  },
                ),
                CarouselItem(
                  image: Image.network(
                    'https://www.gstatic.com/webp/gallery/2.jpg',
                  ),
                  onTap: () {
                    if (kDebugMode) {
                      print('2');
                    }
                  },
                ),
                CarouselItem(
                  image: Image.network(
                    'https://www.gstatic.com/webp/gallery/3.jpg',
                  ),
                  onTap: () {
                    if (kDebugMode) {
                      print('3');
                    }
                  },
                  label: 'Image 3',
                ),
              ],
            ),
            const Text('Text 2'),
          ],
        ),
      ),
    );
  }
}
```

## Additional information

For more information please contact by email: gerard.ggf@gmail.com
