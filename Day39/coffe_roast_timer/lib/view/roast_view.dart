import 'package:flutter/material.dart';
import '../controller/roast_controller.dart';

class RoastView extends StatelessWidget {
  RoastView({super.key});

  final RoastController controller = RoastController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f1eb),

      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        centerTitle: true,

        title: const Text(
          "Coffee Roast Timer",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: Center(
        child: ListenableBuilder(
          listenable: controller,

          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                // Coffee Circle
                Container(
                  height: 190,
                  width: 190,

                  decoration: BoxDecoration(
                    color: controller.model.color,
                    shape: BoxShape.circle,
                  ),
                ),

                const SizedBox(height: 30),

                // Roast Stage
                Text(
                  controller.model.stage,

                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 10),

                // Seconds
                Text(
                  "${controller.model.seconds} Seconds",

                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 35),

                // Buttons Section
                Column(
                  children: [

                    ElevatedButton(
                      onPressed: controller.startRoasting,
                      child: const Text("Start Roasting"),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        ElevatedButton(
                          onPressed: controller.forward,
                          child: const Text("Forward"),
                        ),

                        const SizedBox(width: 10),

                        ElevatedButton(
                          onPressed: controller.back,
                          child: const Text("Back"),
                        ),

                        const SizedBox(width: 10),

                        ElevatedButton(
                          onPressed: controller.reset,
                          child: const Text("Reset"),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}