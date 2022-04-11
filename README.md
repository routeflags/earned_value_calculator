# EarnedValueCalculator

![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) 
[![Gem Version](https://badge.fury.io/rb/earned_value_calculator.svg)](https://badge.fury.io/rb/earned_value_calculator) 
![](https://ruby-gem-downloads-badge.herokuapp.com/earned_value_calculator) 
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop-hq/rubocop) 
[![CircleCI](https://circleci.com/bb/routeflags/earned_value_calculator.svg?style=svg)](https://circleci.com/bb/routeflags/earned_value_calculator)

Calculates the earned value of a project to indicate a diagnosis result.

## What is Earned value management ?

Earned value management (EVM),is a project management technique for measuring project performance and progress in an objective manner from [Earned value management - Wikipedia](https://en.wikipedia.org/wiki/Earned_value_management).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'earned_value_calculator'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install earned_value_calculator

## Usage

Given a project parameters, the calculator output the earned value of the project.
Start date, end date, current date, budget, progress rate and actual total cost are required.

```ruby
project = EarnedValueCalculator.call(Date.today - 3,
                                     Date.today + 3,
                                     Date.today,
                                     100,
                                     10,
                                     10)
project.planned_value
#=> 50
```

### Features

Calculates these metrics of a project:

* earned_value
* planned_value
* schedule_variance
* actual_cost_variance
* cost_performance_index
* schedule_performance_index

#### earned_value (EV)
EV is calculated by multiplying %complete of each task (completed or in progress) by its planned value.
It is based on the formula:

<img src="https://latex.codecogs.com/svg.image?EV&space;=&space;\sum_{Start}^{Current}PV(Completed)" />

#### planned_value (PV)

#### schedule_variance (SV)
It is based on the formula:

    SV = EV - PV

#### actual_cost_variance (CV)
It is based on the formula:

    CV = EV - AC

#### cost_performance_index (CPI)
It is based on the formula:

    CPI = EV ÷ AC

#### schedule_performance_index (SPI)
It is based on the formula:

    SPI = EV ÷ PV


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Test

```bash
rspec spec
```

## Contributing

Bug reports and pull requests are welcome on BitBucket at https://github.com/routeflags/earned_value_calculator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/routeflags/earned_value_calculator/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EarnedValueCalculator project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/routeflags/earned_value_calculator/blob/main/CODE_OF_CONDUCT.md).


## You may enjoy owning other libraries and my company.

* [routeflagsinc / jma — Bitbucket](https://bitbucket.org/routeflagsinc/jma/src/main/)
    - for the Japan Meteorological Agency (気象庁) for searching new information simplifies.
* [smapira / punch_time — Bitbucket](https://bitbucket.org/smapira/punch_time/src/master/)
    - Work time calculations using punch clock.
* [smapira / rspec-css — Bitbucket](https://bitbucket.org/smapira/rspec-css/src/master/)
    - Record your test suite's computed CSS during future test runs for deterministic and accurate tests.
* [smapira/timeline_rails_helper: The TimelineRailsHelper provides a timeline_molecules_tag helper to draw a vertical time line usable with vanilla CSS.](https://github.com/smapira/timeline_rails_helper)
* [smapira/acts_as_tree_diagram: ActsAsTreeDiagram extends ActsAsTree to add simple function for draw tree diagram with html.](https://github.com/smapira/acts_as_tree_diagram)
* [株式会社旗指物](https://blog.routeflags.com/)

## Аcknowledgments

* [Earned value management - Wikipedia](https://en.wikipedia.org/wiki/Earned_value_management)
* [Online Equation Editor - standalone](https://www.codecogs.com/latex/eqneditor.php)
