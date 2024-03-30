/// Format Compact Counter
/// Example: - counterFormat(1309) => '1.3K'

String counterCompactFormat(int counter) {
  return counter >= 1000
      ? '${(counter ~/ 100 / 10).toStringAsFixed(1)}K'
      : counter.toString();
}
