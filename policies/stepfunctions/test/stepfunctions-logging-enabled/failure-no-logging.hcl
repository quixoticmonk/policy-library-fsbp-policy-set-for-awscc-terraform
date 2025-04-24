# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: BUSL-1.1

mock "tfconfig/v2" {
  module {
    source = "./mocks/policy-failure-no-logging/mock-tfconfig-v2.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
