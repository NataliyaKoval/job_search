# Project description
The application for creating new vacancies and viewing available ones.

View all jobs:

![photo_2022-12-28_12-13-20](https://user-images.githubusercontent.com/69919727/209806315-190010f3-6ae7-4031-995e-ba6471318555.jpg)

Filter jobs:

![photo_2022-12-28_12-33-34](https://user-images.githubusercontent.com/69919727/209806567-55e09097-ee0b-4672-8a29-d58f5e8dfff7.jpg)

View job details:

![photo_2022-12-28_12-44-16](https://user-images.githubusercontent.com/69919727/209807239-22c80e2e-b07a-452c-9f43-6da4d1d5c165.jpg)

View all companies:

![photo_2022-12-28_12-44-23](https://user-images.githubusercontent.com/69919727/209807250-474fd467-baa9-4138-9cc3-2507acc6cb6e.jpg)

View company details:

![photo_2022-12-28_12-44-28](https://user-images.githubusercontent.com/69919727/209807256-e1687d8f-5d91-4af8-9ad3-2790d667c7a8.jpg)

Create new company.
Select company and create new job: 

![photo_2022-12-28_12-44-33](https://user-images.githubusercontent.com/69919727/209807260-366f83ed-06ed-4301-96d2-96333ac3080e.jpg)

# Packages
The following packages are used in the project:
* [retrofit](https://pub.dev/packages/retrofit)
* [dio](https://pub.dev/packages/dio)
* [json_annotation](https://pub.dev/packages/json_annotation)
* [flutter_bloc](https://pub.dev/packages/flutter_bloc)
* [provider](https://pub.dev/packages/provider)
* [retrofit_generator](https://pub.dev/packages/retrofit_generator)
* [build_runner](https://pub.dev/packages/build_runner)
* [json_serializable](https://pub.dev/packages/json_serializable)

# Architecture
Inside the project we use some sort of Clean Architecture + Bloc.

![image](https://user-images.githubusercontent.com/69919727/209799669-91a6f10b-fc4f-4589-b5e3-d6683880294e.png)

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
