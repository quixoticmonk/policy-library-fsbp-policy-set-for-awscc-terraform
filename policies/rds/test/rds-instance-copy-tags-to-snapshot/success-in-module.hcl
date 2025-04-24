mock "tfconfig/v2" {
  module {
    source = "./mocks/policy-success-in-module/mock-tfconfig-v2.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
