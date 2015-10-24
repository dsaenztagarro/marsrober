# marsrover

Branches
--------

**IMPORTANT**

In order to see implementations in action just take a look at acceptance tests!


Rake tasks
----------

- `test:acceptance`: run acceptance tests with `cucumber`
- `test:unit`: run unit tests with `rspec`
- `test:all`: run all tests 
- `quality:rubocop`: run rubocop
- `quality:reek`: run reek
- `quality:cane`: run cane
- `quality:all`: run all quality metric tasks

Coverage
--------

To generate locally coverage report:

```
export COVERAGE=true
bundle exec rake test:all
```

Dictionary
----------

- `DSN`: Deep Space Network

Documentation
-------------

1. Run local documentation server: `yard server`

2. [Check documentation](http://localhost:8808)

