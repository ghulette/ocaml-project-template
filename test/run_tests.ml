let test_suites : unit Alcotest.test list = [("Sub2.A", A_test.tests)]
let () = Alcotest.run "proj" test_suites
