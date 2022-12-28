# Architecture
Inside the project we use some sort of Clean Architecture + Bloc.

## Presentation

### Screens
For each screen we have its' own folder.
Screen folder usually contain 3 inner folders:
* bloc
* usecase
* widget

#### Bloc
For each screen we have its' own bloc (or cubit). Bloc (cubit) doesn't have access to data layer. Communication with data layer works only through usecases.
Every usecase call should be wrapped with try-catch to handle errors;

#### Usecase
* Represents concepts of the business, information about the current situation and business rules.
* Usecase implements one of base usecases.
* If usecase needs 1 parameter, it's OK to set parameter type as generic, but if usecase needs 2 or more parameters, `**UseCaseParam` class should be created.

#### Widgets
* Widgets should be logic-free. All possible business logic should be inside Bloc(Cubit).
* For every reusable widget should be created separate stateless/stateful widget.
* For `**Page` widget should be used `BlocProvider`

### Widgets
Every "global" reusable widget should be placed in this folder.

## Domain

* Yes, blocs(cubits) and usecases are part of Domain Layer in wide-meaning, but it's easier to use them in screens when it's near to the "context".

### Models
* This folder contains Domain Layer models that are used inside Presentation Layer. Each model should be PODO (Plain Old Dart Object).

### Usecase
* Reusable usecases should be placed here

### Repository
* This folder contains repositories interfaces. That means that no implementation should be here.

## Data

### Entity

### Repository implementation
* Every repository implements repository interface.
* **Repository** - The decision maker class when it comes to manage data CRUD operations. Operations can be done in this layer is caching mechanism, manage consecutive api calls etc…

## Dependency Injection

* For Dependency Injection we use `Provider`.
* We have `Providers` class that includes providers for different utilities, repositories and services.
