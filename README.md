# heroes.me-iOS
A simple app showing heroes information in a table

![Screenshot](imgs/SimulatorScreen.png)

## Dependencies

It uses Cocoapods as the dependency manager. It depends on SDWebImage and Alamofire.

## Architecture

The project tries to follow a clean architecture:

* The presentation layer is based on MVP. The communication from the presenter to the view (viewcontroller) is thought a protocol. There should not be logic in the view, just framework related code. Moving the logic to the presenter increases the testability.

* The data layer uses a repository pattern. Since there´s only one datasource at the moment, the access to the data is directly trough the datasource. If we add a new datasource in the future, the repository itself should be created to handle the data access policies.

## Testing

There are some basic tests illustrating the testability of the architecture.
