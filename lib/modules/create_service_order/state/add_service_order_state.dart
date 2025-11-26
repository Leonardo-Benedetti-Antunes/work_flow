abstract class ServiceOrderState {}

/// Estado inicial da criação
class ServiceOrderStateCreate extends ServiceOrderState {}

/// Estado inicial da edição
class ServiceOrderStateEdit extends ServiceOrderState {
  final String name;
  final String description;
  final int status;
  final String place;
  final String createdAt;
  final String initiatedAt;
  final String finishedAt;

  ServiceOrderStateEdit({
    required this.name,
    required this.description,
    required this.status,
    required this.place,
    required this.createdAt,
    required this.initiatedAt,
    required this.finishedAt,
  });
}

/// Estados adicionais essenciais
class ServiceOrderLoading extends ServiceOrderState {}

class ServiceOrderSuccess extends ServiceOrderState {}

class ServiceOrderError extends ServiceOrderState {
  final String message;
  ServiceOrderError(this.message);
}
