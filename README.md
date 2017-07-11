# astrid-clone

Welcome to Astrid-Clone, a Rails task manager web app, with Twilio SMS reminders.  Read my blog post about the project [here](http://nicholasbair.com/2017/07/11/astrid_clone_maybe/)

![astrid4](https://user-images.githubusercontent.com/8889403/28085388-9dd9474e-6649-11e7-968b-006667ab700f.gif)

## Project goals
See [spec](SPEC.md) for project requirements.

## Installation
1. Fork
2. Clone
3. CD into project directory
4. $ touch .env
5. Update .env with required keys/tokens, use [sample dotenv](dotenv_sample.txt) as guide
4. $ bundle
5. $ rails s
6. In another terminal, CD into project root and $ rake jobs:work
7. Open browser to url provided in console (probably localhost:3000)

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/nicholasbair/astrid-clone.

## License
The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
