# Smithy4s Demo

Minimal example of using [smithy4s](https://github.com/disneystreaming/smithy4s) for generating some of the models, following this [guide](https://disneystreaming.github.io/smithy4s/docs/overview/quickstart). It showcases usage of:

- API models
- API errors
- query parameters
- path parameters

# Modules

- [Smithy model](./modules/example/src/main/smithy/ExampleService.smithy)
- [Scala service Impl & Http4s setup](modules/example/src/main/scala)

# Setup

Running `sbt compile` would generate scala files in: `modules/example/target/scala-2.13/src_managed/main/smithy4s/` which are not included in the repo.

# Run

From the root directory, run:

```
sbt "example/run"
```

and navigate to: http://localhost:9000/docs and interact with the swagger docs.