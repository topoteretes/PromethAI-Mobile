extension RangeExtension on int {
  List<int> upTo(int maxInclusive, {int stepSize = 1}) => [for (int i = this; i <= maxInclusive; i += stepSize) i];
}
