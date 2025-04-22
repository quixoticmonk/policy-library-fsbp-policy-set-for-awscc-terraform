mock "tfplan/v2" {
  module {
    source = "./mocks/policy-failure-cloudtrail-log-file-validation-not-enabled/mock-tfplan-v2.sentinel"
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
    main = false
  }
}
