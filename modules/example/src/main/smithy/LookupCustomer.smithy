$version: "2.0"

namespace smithy4s.hello
use smithy4s.api#uuidFormat

@http(method: "GET", uri: "/lookup/{customerId}", code: 200)
operation LookupCustomer {
    input:= {
        @httpLabel
        @required
        customerId: CustomerId
    }
    //sadly we can't use unions directly as outputs, hence the nesting. see this: https://github.com/awslabs/smithy/issues/1112#issuecomment-1054445719
    output:= {
        @required
        customer: Customer
    }
}

@uuidFormat
string CustomerId

union Customer {
    activeCustomer: ActiveCustomer
    inactiveCustomer: InactiveCustomer
}

structure ActiveCustomer {
    @required
    customerId: CustomerId

    @required
    credit: Integer
}

structure InactiveCustomer {
    @required
    customerId: CustomerId
}