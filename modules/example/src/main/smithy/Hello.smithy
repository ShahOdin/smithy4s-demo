$version: "2.0"

namespace smithy4s.hello

@http(method: "POST", uri: "/{name}", code: 200)
operation Hello {
    input: Person,
    output: Greeting,
    errors: [YouShallNotPass]
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

string Town

@input
structure Person {
    @httpLabel
    @required
    name: String,

    @httpQuery("town")
    town: Town
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
    @jsonName("error")
    message: String
}
