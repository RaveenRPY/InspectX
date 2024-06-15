library inspectx;

// This library provides the InspectX widget for debugging and development purposes.

import 'package:flutter/material.dart';

// InspectX widget that wraps around a screen and displays the class name at the bottom.
class InspectX extends StatelessWidget {
  final Widget? child;

  // The main content widget.
  final Widget? page;

  // The page widget to be displayed.
  final bool isVisible;

  // Toggle visibility of the class name overlay.
  final Type? className;

  // The type of the class to be displayed.

  // Constructor for InspectX widget.
  const InspectX({
    super.key,
    this.child,
    this.page,
    this.className,
    this.isVisible = true,
  });

  // Build method for InspectX widget.
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          if (child != null) child!,

          // Display the child widget if not null.
          if (page != null) page!,

          // Display the page widget if not null.
          if (isVisible)

            // Display the class name overlay if isVisible is true.
            Positioned(
              bottom: 2,
              left: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.7),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: child != null
                    ? Text(
                        className.toString(),

                        // Display the class name of the child widget.
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      )
                    : page != null
                        ? Text(
                            page!.runtimeType.toString(),

                            // Display the class name of the page widget.
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          )
                        : const SizedBox.shrink(),

                // If both child and page are null, display an empty widget.
              ),
            ),
        ],
      ),
    );
  }
}
