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
- `quality:yardstick_measure`: run documentation coverage

Coverage
--------

To generate locally coverage report:

```
export COVERAGE=true
bundle exec rake test:all
```

Conventions
-----------

- Two robotic rovers never are deployed to the same point
- Once a rover finds an obstacle over the surface of Mars it discards any
  instruction pending until engineers check what happens

Dictionary
----------

- `DSN`: Deep Space Network

Documentation
-------------

1. Run local documentation server: `yard server`

2. [Check documentation](http://localhost:8808)

