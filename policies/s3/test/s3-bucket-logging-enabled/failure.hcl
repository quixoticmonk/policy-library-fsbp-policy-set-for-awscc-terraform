mock "tfconfig/v2" {
  module {
    source = "./mocks/policy-failure/mock-tfconfig-v2.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
