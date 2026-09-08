

import 'package:flutter/material.dart';
import 'package:planet_app/const/constants.dart';
import 'package:planet_app/screens/qr_overlay.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool isTorchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Camera functionality disabled (requires external package).
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.qr_code_scanner, size: 120.0, color: Colors.grey),
                  const SizedBox(height: 16.0),
                  const Text(
                    'اسکنر دوربین در دسترس نیست. می‌توانید کُد را دستی وارد کنید:',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'کد را وارد کنید',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      debugPrint('Simulated scan: $value');
                    },
                  ),
                  const SizedBox(height: 12.0),
                  ElevatedButton(
                    onPressed: () {
                      debugPrint('Simulate scan pressed');
                    },
                    child: const Text('شبیه‌سازی اسکن'),
                  ),
                ],
              ),
            ),
          ),
          QRScannerOverlay(
            overlayColour: Colors.black.withOpacity(0.5),
          ),
          // AppBar
          Positioned(
            top: 50.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  // X Button
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Constants.primaryColor.withOpacity(0.2),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Torch Button
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constants.primaryColor.withOpacity(0.2),
                  ),
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(isTorchOn ? Icons.flash_on : Icons.flash_off, color: isTorchOn ? Colors.yellow : Colors.white),
                    onPressed: () {
                      setState(() {
                        isTorchOn = !isTorchOn;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
