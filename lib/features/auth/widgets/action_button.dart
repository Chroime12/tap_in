import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.loadingLabel = 'Loading...',
  });

  final Future<void> Function() onPressed;
  final String label;
  final IconData icon;
  final String loadingLabel;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool _isLoading = false;

  void _handlePress() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressed();
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: _isLoading ? null : _handlePress,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (_isLoading)
              SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                  strokeWidth: 2,
                ),
              )
            else
              Icon(
                widget.icon,
                color: Colors.white,
              ),
            const SizedBox(width: 10),
            Text(
              _isLoading ? widget.loadingLabel : widget.label,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
