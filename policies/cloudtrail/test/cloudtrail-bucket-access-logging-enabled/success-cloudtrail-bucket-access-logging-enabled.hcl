mock "tfconfig/v2" {
  module {
    source = "./mocks/policy-success-cloudtrail-bucket-access-logging-enabled/mock-tfconfig-v2.sentinel"
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
