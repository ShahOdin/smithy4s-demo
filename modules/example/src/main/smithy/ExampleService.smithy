$version: "2.0"
namespace smithy4s.hello
use alloy#simpleRestJson

@simpleRestJson
service HelloWorldService {
    version: "1.0.0",
    operations: [Hello]
}
