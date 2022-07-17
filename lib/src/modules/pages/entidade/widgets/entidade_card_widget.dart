// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EntidadeCardWidget extends StatelessWidget {
  const EntidadeCardWidget({
    Key? key,
    required this.titulo,
    this.subtitlo,
  }) : super(key: key);
  final String titulo;
  final String? subtitlo;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 240, 240, 240),
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      subtitlo ?? '',
                      style: const TextStyle(fontSize: 18),
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 30),
            Column(
              children: [
                Container(
                  //margin: const EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(
                    'assets/edit.svg',
                    width: 25,
                    height: 25,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
