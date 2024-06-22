import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
          Color.fromARGB(255, 211, 118, 130),
          Color.fromARGB(255, 253, 181, 168)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)));
    return Stack(
      children: [
        _buildBodyBack(),
        Positioned.fill(
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              const SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Novidades'),
                  centerTitle: true,
                  titlePadding: EdgeInsets.only(bottom: 15),
                ),
              ),
              FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance
                      .collection("home")
                      .orderBy("priority")
                      .get(),
                  builder: (_, snapshot) {
                    if (!snapshot.hasData) {
                      return SliverToBoxAdapter(
                        child: Container(
                          height: 200.0,
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                      );
                    } else {
                      return SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8.0,
                                crossAxisSpacing: 8.0,
                                childAspectRatio: 0.65),
                        delegate: SliverChildBuilderDelegate(
                          childCount: snapshot.data!.docs.length,
                          (context, index) {
                            return FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: snapshot.data!.docs[index].get("imageUrl"),
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      );
                    }
                  })
            ],
          ),
        )
      ],
    );
  }
}
