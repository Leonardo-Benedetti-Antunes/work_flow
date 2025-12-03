# 📱 Work Flow — Documentação Simplificada do Projeto

Abaixo está uma visão geral simples e objetiva da estrutura do projeto **Work Flow**, incluindo o propósito de cada pasta.

---

## 📂 Estrutura de Pastas

```
C:\PROJETOS\MOBILE\WORK_FLOW\LIB
├── assets
│   ├── icons
│   └── images
├── core
│   ├── database
│   │   └── migrations
│   ├── di
│   └── domain
│       ├── contract
│       │   ├── repository
│       │   │   ├── image
│       │   │   └── service_order
│       │   └── usecase
│       ├── enum
│       ├── model
│       └── usecase
├── modules
│   ├── create_service_order
│   │   ├── controller
│   │   ├── state
│   │   └── view
│   │       └── widgets
│   ├── home_page
│   │   ├── controller
│   │   ├── state
│   │   └── view
│   │       └── widgets
│   ├── service_order_details
│   │   ├── controller
│   │   ├── state
│   │   └── view
│   │       └── components
│   └── update_service_order
│       ├── controller
│       ├── state
│       └── view
└── repository
    ├── image
    │   └── image
    └── service_order
```

---

## 📦 Descrição das Pastas

### **assets/**
Contém arquivos estáticos utilizados pelo app.
- **icons/**: ícones usados nas telas.
- **images/**: imagens gerais da interface.

---

## ⚙ **core/** (camada central da aplicação)
Agrupa tudo que é **núcleo**, **genérico** e **compartilhado** entre módulos.

### **database/migrations/**
Scripts e arquivos que definem a estrutura do banco de dados local.

### **di/**
Configurações do **GetIt / Injectable** para injeção de dependência.

### **domain/**
Contém os elementos principais da regra de negócio.

#### **contract/repository/**
Define interfaces dos repositórios para:
- **image/**: operações da entidade imagem.
- **service_order/**: operações da ordem de serviço.

#### **contract/usecase/**
Interfaces para **casos de uso** (executados pelos controllers/BLocs).

#### **enum/**
Enums utilizados no domínio, como `StatusEnum`.

#### **model/**
Modelos principais da aplicação (ex.: `ServiceOrderModel`).

#### **usecase/**
Implementações dos casos de uso, como:
- buscar ordens de serviço
- criar/editar
- deletar imagens

---

## 🧩 **modules/**
Contém todas as telas do app organizadas por contexto. Cada módulo segue o padrão:
- **controller** — BLoC / Cubits com regras da tela
- **state** — estados da tela
- **view** — UI
- **widgets/components** — pedaços reutilizáveis da interface

### **create_service_order/**
Fluxo de criação de uma nova ordem de serviço.

### **home_page/**
Tela principal onde aparecem as ordens listadas.

### **service_order_details/**
Tela com detalhes completos da ordem selecionada.

### **update_service_order/**
Tela para edição de uma ordem existente.

---

## 🗄 **repository/**
Implementação concreta dos repositórios definidos em `core/domain/contract/repository`.

### **image/**
Acesso a banco/sqflite para lidar com imagens.

### **service_order/**
Repositório responsável por CRUD de ordens de serviço.

---

Se quiser, posso adicionar também:
- fluxos das telas
- arquitetura (camadas)
- diagrama simples
- instruções de instalação e execução
- descrição dos principais UseCases
- regras de negócio resumidas
