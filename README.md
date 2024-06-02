# Generate Swagger Endpoints

If you are using **Flutter** with **Swagger**, you may be annoyed that no library allows you to build models and endpoints flexibly. For example, a popular library called [swagger_dart_code_generator](https://pub.dev/packages/swagger_dart_code_generator) includes most functionality, but it is not flexible at all. It strictly binds the [Chopper](https://pub.dev/packages/chopper), if you don't want to use another client library like [Dio](https://pub.dev/packages/dio), you can only generate data models without any endpoint. That is a library I built for my freelance projects and company projects to quickly solve these issues of [swagger_dart_code_generator](https://pub.dev/packages/swagger_dart_code_generator). I saw my friend also face this issue on his company's new project. ~~So he should treat me a Big Mac now~~

This project is still very simple and I am busy on another thing right now, please leave your feedback on the issues or the requirements on the issues.

## Install

```Bash
dart pub global activate generate_swagger_endpoint
```

### How to use

```Bash
dart pub global run generate_swagger_endpoint --input ./lib/api/swagger -output ./lib/api/endpoints/

dart pub global run generate_swagger_endpoint --input ./lib/api/swagger -output ./lib/api/endpoints/
```
