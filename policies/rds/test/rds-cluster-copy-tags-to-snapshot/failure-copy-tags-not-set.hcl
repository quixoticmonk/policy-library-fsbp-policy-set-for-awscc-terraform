mock "tfconfig/v2" {
  module {
    source = "./mocks/policy-failure-copy-tags-not-set/mock-tfconfig-v2.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
