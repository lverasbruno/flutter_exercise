abstract final class TimeFormatter {
  static String formatDuration(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes}m ${seconds}s';
  }

  static String formatRemainingTime({
    required double percentage,
    required int totalSeconds,
  }) {
    final remaining = (totalSeconds * (1 - percentage / 100)).round();
    return formatDuration(remaining);
  }
}
