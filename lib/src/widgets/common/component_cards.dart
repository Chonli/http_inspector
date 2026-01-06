import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    super.key,
    required this.child,
    this.backgroundColor = const Color(0xFFF0F0F0),
  });

  final Color backgroundColor;
  final Widget child;

  @Preview(name: 'BackgroundCard', group: 'Components')
  static Widget preview() {
    return const BackgroundCard(
      backgroundColor: Colors.red,
      child: Text('Test'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: backgroundColor),
      ),
      child: Padding(padding: const EdgeInsets.all(12), child: child),
    );
  }
}

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key, required this.message});
  final String message;

  @Preview(name: 'EmptyCard', group: 'Components')
  static Widget preview() {
    return const EmptyCard(message: 'No data');
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundCard(
      child: Center(
        child: Column(
          children: [const Icon(Icons.inbox_outlined, size: 48), Text(message)],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.title,
    required this.children,
    this.backgroundColor = const Color(0xFFF0F0F0),
    this.titleColor = Colors.grey,
    this.icon,
  });

  final String title;
  final List<Widget> children;
  final Color? titleColor;
  final Color backgroundColor;
  final IconData? icon;

  @Preview(name: 'InfoCard', group: 'Components')
  static Widget preview() {
    return const InfoCard(
      title: 'Request Url',
      children: [
        InfoRow(label: 'Method', value: 'GET'),
        InfoRow(label: 'Status Code', value: '200'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundCard(
      backgroundColor: backgroundColor,
      child: Column(
        spacing: 8,
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 12, color: titleColor),
                const SizedBox(width: 2),
              ],
              Text(title.toUpperCase()),
            ],
          ),
          ...children,
        ],
      ),
    );
  }
}

class DataCard extends StatelessWidget {
  const DataCard({super.key, required this.title, required this.data});

  final String title;
  final String data;

  @Preview(name: 'DataCard', group: 'Components')
  static Widget preview() {
    return const DataCard(
      title: 'Resquest header',
      data: '''
{
    "key": "value"
}
    ''',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundCard(
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toUpperCase()),
          BackgroundCard(
            backgroundColor: Colors.white,
            child: Row(
              crossAxisAlignment: .start,
              children: [
                Expanded(child: SelectableText(data)),
                IconButton(
                  icon: const Icon(Icons.copy, size: 16),
                  onPressed: () {
                    // TODO implement copy
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Copied to clipboard'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  tooltip: 'Copy to clipboard',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Expanded(
          flex: 2,
          child: Text(label, style: const TextStyle(color: Colors.grey)),
        ),
        Expanded(flex: 3, child: SelectableText(value)),
      ],
    );
  }
}
