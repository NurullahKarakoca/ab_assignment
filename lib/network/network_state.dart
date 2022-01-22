enum NetworkStatus { idle, running, failed }

class NetworkState {
  static var loaded = NetworkState(NetworkStatus.idle);
  static var loading = NetworkState(NetworkStatus.running);

  get isLoading => status == NetworkStatus.running;
  get isLoaded => status == NetworkStatus.idle;
  get isFailed => status == NetworkStatus.failed;

  static failed(String errorMessage) =>
      NetworkState(NetworkStatus.failed, errorMessage: errorMessage);

  final NetworkStatus status;
  final String? errorMessage;
  dynamic data;

  NetworkState(this.status, {this.errorMessage, this.data});
}
