extension ResponseBodyExt on int {
  String get formatSize => switch (this) {
    < 1024 => '$this B',
    < 1024 * 1024 => '${(this / 1024).toStringAsFixed(1)} KB',
    _ => '${(this / (1024 * 1024)).toStringAsFixed(2)} MB',
  };
}
