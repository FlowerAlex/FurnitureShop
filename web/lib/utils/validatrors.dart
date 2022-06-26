abstract class AppValidators {
  Validator and(
    Iterable<Validator> validators,
    String? errorMessage,
  ) =>
      (value) {
        for (final validator in validators) {
          final result = validator.call(value);

          if (result != null) {
            return errorMessage ?? result;
          }
        }
        return null;
      };

  Validator or(
    Iterable<Validator> validators,
    String? errorMessage,
  ) =>
      (value) {
        String? message;
        for (final validator in validators) {
          final result = validator.call(value);

          if (result == null) {
            return null;
          }
          message = errorMessage ?? result;
        }
        return message;
      };
}

typedef Validator = String? Function(String errorMessage);
