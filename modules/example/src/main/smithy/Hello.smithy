$version: "2.0"

namespace smithy4s.hello


@http(method: "GET", uri: "/hello/{name}", code: 200)
operation Hello {
    input: Person,
    output: Greeting,
    errors: [YouShallNotPass]
}



//@error("client")
//@httpError(400)
@error("client")
@httpError(201)
@suppress(["HttpResponseCodeSemantics"])
structure YouShallNotPass {
    @required
    message: String
}

apply Hello @examples([
    {
        title: "My name is Jeff"
        input: {
            name: "Jeff"
        }
        output: {
            message: "Hello Jeff from Town of Jefferson!"
        }
    },
    {
        title: "Unhappy path"
        input: {
            name: "Foo"
        }
        error: {
            shapeId: YouShallNotPass
            content: {
                "message": "Nope!"
            }
        }
    }
])

@input
structure Person {
    @httpLabel
    @required
    name: String
}

@output
structure Greeting {
    @required
    message: String
}
