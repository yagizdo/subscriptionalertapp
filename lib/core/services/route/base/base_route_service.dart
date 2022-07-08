abstract class BaseRouteService {
  void push({required String route, Object extra});
  void go({required String route, Object extra});
  void pop();
}
