# failing_hyperclient_test
This repo demonstrates a failing test case of [HyperClient](https://github.com/codegram/hyperclient)

## Run the test

```
$ bundle install
$ rspec
```

Output:
```
$ rspec
.F

Failures:

  1) Hyperclient getting second page returns record in second page
     Failure/Error: expect(subject.next.names.first.name).to eq 'page2'
       
       expected: "page2"
            got: "page3"
       
       (compared using ==)
     # ./spec/hyperclient_spec.rb:41:in `block (3 levels) in <top (required)>'

Finished in 0.03404 seconds (files took 0.29426 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/hyperclient_spec.rb:40 # Hyperclient getting second page returns record in second page
```

## About the test

This repo only has one rspec test: `spec/hyperclient_spec.rb`. It uses `webmock` to stub the http request calls and return HAL Json response.
