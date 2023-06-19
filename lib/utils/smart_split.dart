import 'package:amplify_flutter/amplify_flutter.dart';

(List<String> result, String separator) smartSplit(String source, String separator) {
  var sep = separator;
  var result = source.split(sep);

  if (result.length > 1) {
    return (result, sep);
  }

  sep = separator.replaceAll("-", " ");
  result = source.split(sep);
  if (result.length > 1) {
    return (result, sep);
  }

  sep = separator.replaceAll(" ", "-");
  result = source.split(sep);
  if (result.length > 1) {
    return (result, sep);
  }

  sep = separator.replaceAll("_", " ");
  result = source.split(sep);
  if (result.length > 1) {
    return (result, sep);
  }

  sep = separator.capitalized;
  result = source.split(sep);
  if (result.length > 1) {
    return (result, sep);
  }

  sep = separator.toLowerCase();
  result = source.split(sep);
  if (result.length > 1) {
    return (result, sep);
  }

  sep = separator.toUpperCase();
  result = source.split(sep);
  if (result.length > 1) {
    return (result, sep);
  }

  return ([source], sep);
}
