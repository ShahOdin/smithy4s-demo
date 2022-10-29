$version: "2.0"
namespace smithy4s.hello

use smithy4s.api#simpleRestJson

@simpleRestJson
service HelloWorldService {
    version: "1.0.0",
    operations: [Hello, Choice]
    errors: [YouShallNotPass]
}

//Hello

@http(method: "POST", uri: "/{name}", code: 200)
operation Hello {
    input: Person,
    output: Greeting
}

structure Person {
    @httpLabel
    @required
    name: String,

    @httpQuery("town")
    town: String
}

structure Greeting {
    @required
    message: String
}

@error("client")
@httpError(400)
structure YouShallNotPass {
    @required
    message: String
}

// Choice

enum Pill {
    Wisdom = "red"
    Ignorance = "blue"
}

structure Consequence {
    @required
    message: String
}

@http(method: "GET", uri: "/choose/{pill}", code: 200)
operation Choice {
    input:= {
        @required
        @httpLabel
        pill: Pill
    },
    output: Consequence
}