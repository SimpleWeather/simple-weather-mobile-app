import 'package:flutter/material.dart';

class CreateCityInteractionBottomSheet extends StatefulWidget {
  final int cityId;
  final Function(String) onConfirmTap;

  const CreateCityInteractionBottomSheet({
    super.key,
    required this.cityId,
    required this.onConfirmTap,
  });

  @override
  State<CreateCityInteractionBottomSheet> createState() =>
      _CreateCityInteractionBottomSheetState();
}

class _CreateCityInteractionBottomSheetState
    extends State<CreateCityInteractionBottomSheet> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: size.height * .85,
      width: size.width,
      child: Column(
        children: [
          const SizedBox(height: 20),
          TextFormField(
            controller: controller,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Escreva alguma coisa',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const Spacer(),
          FilledButton(
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Colors.blueAccent,
              ),
            ),
            onPressed: () {
              widget.onConfirmTap(controller.text);
              Navigator.pop(context);
            },
            child: const Text(
              'Confirmar',
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
