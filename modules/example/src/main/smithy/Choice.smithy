//$version: "2.0"
//
//namespace smithy4s.hello
//
//@documentation("This is your last chance. After this there is no turning back")
//enum Pill {
//    Wisdom = "red"
//    Ignorance = "blue"
//}
//
//@output
//structure Consequence {
//    @required
//    message: String
//}
//
//@readonly
//@http(method: "GET", uri: "/choose/{pill}", code: 200)
//operation Choice {
//    input:= {
//        @required
//        @httpLabel
//        pill: Pill
//    },
//    output: Consequence
//}
