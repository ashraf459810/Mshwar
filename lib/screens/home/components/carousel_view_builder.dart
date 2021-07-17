import 'package:dellyshop/constant.dart';
import 'package:dellyshop/models/Sliders.dart/Sliders.dart';
import 'package:dellyshop/widgets/carousel_pro.dart';
import 'package:dellyshop/widgets/shimmer_widger.dart';
import 'package:flutter/material.dart';

class CarouselViewBuilder extends StatefulWidget {
  final Sliders sliders;
  CarouselViewBuilder(this.sliders);
  @override
  _CarouselViewBuilderState createState() => _CarouselViewBuilderState();
}

class _CarouselViewBuilderState extends State<CarouselViewBuilder> {
  List<NetworkImage> images = [];

  @override
  void initState() {
    images = getimages(widget.sliders);
    print(images.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 182.0,
      child: images.isNotEmpty
          ? new Carousel(
            
              borderRadius: true,
              boxFit: BoxFit.cover,
              radiusDouble: 10,
              radius: Radius.circular(10.0),
              dotColor: kWhiteColor,
              dotSize: 5.5,
              dotSpacing: 16.0,
              dotBgColor: Colors.transparent,
              showIndicator: true,
              overlayShadow: true,
              overlayShadowSize: 0.9,
              images: images)
          : ShimmerWidget(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: kWhiteColor,
                ),
                height: 182.0,
              ),
            ),
    );
  }
}

List<NetworkImage> getimages(Sliders sliders) {
  List<NetworkImage> images = [];
  if (sliders != null) {
    print("here not null");
    for (var i = 0; i < sliders.slides.length; i++) {
      images.add(NetworkImage(sliders.slides[i].image));
    }
    return images;
  } else {
    print("here null");
    return images;
  }
}


