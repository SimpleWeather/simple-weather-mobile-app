import 'package:flutter/material.dart';

class CityFeedInteractionCardBottomSheet extends StatelessWidget {
  final VoidCallback onDeleteTap;

  const CityFeedInteractionCardBottomSheet({
    super.key,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return FittedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        width: size.width,
        child: Column(
          children: [
            ListTile(
              onTap: () {
                onDeleteTap();
                Navigator.pop(context);
              },
              leading: const Icon(Icons.delete),
              title: const Text('Deletar interação'),
            ),
          ],
        ),
      ),
    );
  }
}
