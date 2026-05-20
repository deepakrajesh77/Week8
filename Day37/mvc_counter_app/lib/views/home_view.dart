import 'package:flutter/material.dart';
import '../controllers/counter_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CounterController controller = CounterController();

  void refresh() {
    setState(() {});
  }

  Widget actionButton({
    required IconData icon,
    required Color color,
    required String text,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [

        GestureDetector(
          onTap: onTap,

          child: Container(
            width: 85,
            height: 85,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.2),

              border: Border.all(
                color: color,
                width: 3,
              ),
            ),

            child: Icon(
              icon,
              color: color,
              size: 40,
            ),
          ),
        ),

        const SizedBox(height: 10),

        Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Light background
      backgroundColor: const Color(0xFFF5F7FF),

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,

        backgroundColor: const Color(0xFF6C63FF),

        title: const Text(
          "MVC Counter App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Counter Circle
            Container(
              width: 260,
              height: 260,

              decoration: const BoxDecoration(
                shape: BoxShape.circle,

                gradient: LinearGradient(
                  colors: [
                    Color(0xFF6C63FF),
                    Color(0xFF9D4EDD),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),

              child: Center(
                child: Container(
                  width: 240,
                  height: 240,

                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,

                    // Changed inner circle color
                    color: Color(0xFFFDFDFF),
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        "${controller.counterValue}",
                        style: const TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6C63FF),
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "COUNTER VALUE",
                        style: TextStyle(
                          color: Colors.black54,
                          letterSpacing: 4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 60),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                actionButton(
                  icon: Icons.remove,
                  color: Colors.redAccent,
                  text: "DECREASE",
                  onTap: () {
                    controller.decrement();
                    refresh();
                  },
                ),

                actionButton(
                  icon: Icons.refresh,
                  color: Colors.orange,
                  text: "RESET",
                  onTap: () {
                    controller.reset();
                    refresh();
                  },
                ),

                actionButton(
                  icon: Icons.add,
                  color: Colors.green,
                  text: "INCREASE",
                  onTap: () {
                    controller.increment();
                    refresh();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}