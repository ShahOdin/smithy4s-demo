$version: "2.0"
namespace smithy4s.hello

use smithy4s.api#simpleRestJson

@simpleRestJson
service HelloWorldService {
    version: "1.0.0",
    operations: [Hello, Choice]
}