mock "tfconfig/v2" {
  module {
    source = "./mocks/policy-success-cloudtrail-cloudwatch-logs-group-arn-present/mock-tfconfig-v2.sentinel"
  }
}

mock "tfresources" {
  module {
    source = "../../../../modules/tfresources/tfresources.sentinel"
  }
}

mock "report" {
  module {
    source = "../../../../modules/report/report.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
