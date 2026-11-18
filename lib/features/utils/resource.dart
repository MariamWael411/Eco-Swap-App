enum Status { intial, success, error, loading }

class Resource<T> {
  T? data;
  String? errorMessage;
  Status? status;

  Resource({
    required this.status,
    required this.errorMessage,
    required this.data,
  });

  Resource.initial() {
    status = Status.intial;
  }

  Resource.success({required this.data}) {
    status = Status.success;
  }

  Resource.error({required this.errorMessage}) {
    status = Status.error;
  }

  Resource.loading() {
    status = Status.loading;
  }

  bool get isSuccess => status == Status.success;

  bool get isError => status == Status.error;

  bool get isLoading => status == Status.loading;
}
