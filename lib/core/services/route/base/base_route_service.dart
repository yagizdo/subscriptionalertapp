abstract class BaseRouteService {
  void push({required String route});
  void pushWithArgs({required String route, required Object args});
  void go({required String route});
  void pop();
}
