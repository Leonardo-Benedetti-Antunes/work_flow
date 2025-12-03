enum StatusEnum { naoIniciado, iniciado, finalizado, cancelado }

extension StatusEnumExtension on StatusEnum {
  String get name {
    switch (this) {
      case StatusEnum.naoIniciado:
        return 'Não iniciado';
      case StatusEnum.iniciado:
        return 'Iniciado';
      case StatusEnum.finalizado:
        return 'Finalizado';
      case StatusEnum.cancelado:
        return 'Cancelado';
    }
  }
}
