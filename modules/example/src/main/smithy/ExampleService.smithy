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

apply Hello @examples([
    {
        title: "My name is Jeff"
        input: {
            name: "Jeff",
            town: "Town of Jefferson"
        }
        output: {
            message: "Hello Jeff from Town of Jefferson!"
        }
    }
])

@input
structure Person {
    @httpLabel
    @required
    name: String,

    @httpQuery("town")
    town: String
}

@output
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
@documentation("This is your last chance. After this there is no turning back")
enum Pill {
    Wisdom = "red"
    Ignorance = "blue"
}

@output
structure Consequence {
    @required
    message: String
}

@readonly
@http(method: "GET", uri: "/choose/{pill}", code: 200)
operation Choice {
    input:= {
        @required
        @httpLabel
        pill: Pill
    },
    output: Consequence
}