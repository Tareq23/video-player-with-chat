

import 'package:flutter/material.dart';

class NetworkImageBuilder extends StatelessWidget {
  final String imageUrl;
  const NetworkImageBuilder({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
      errorBuilder: (_,__,___){
        return Image.asset(
          'assets/images/thumbnail.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
