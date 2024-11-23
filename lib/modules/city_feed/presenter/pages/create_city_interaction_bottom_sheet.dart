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
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      height: size.height * .8,
      width: size.width,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Diga algo sobre a cidade',
            style: TextStyle(
              fontSize: 26,
            ),
          ),
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
          ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, value, _) {
                final enabled = value.text.isNotEmpty;

                return SizedBox(
                  width: 270,
                  height: 50,
                  child: FilledButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            4,
                          ),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        enabled ? Colors.blueAccent : Colors.grey[400],
                      ),
                    ),
                    onPressed: () {
                      if (!enabled) return;

                      widget.onConfirmTap(controller.text);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Confirmar',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                );
              }),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
