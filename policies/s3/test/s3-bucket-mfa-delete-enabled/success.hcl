mock "tfconfig/v2" {
  module {
    source = "./mocks/policy-success/mock-tfconfig-v2.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
