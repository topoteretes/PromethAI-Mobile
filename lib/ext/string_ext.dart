extension Ext on String? {
  get isBlank => this == null || this!.isEmpty;
  get isNotBlank => !isBlank;
}