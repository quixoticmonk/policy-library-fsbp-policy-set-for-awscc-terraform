mock "tfconfig/v2" {
  module {
    source = "./mocks/policy-failure-copy-tags-false/mock-tfconfig-v2.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
