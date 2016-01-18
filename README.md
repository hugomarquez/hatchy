# Hatchy - Crowdfunding Platform

Hatchy, is the first open source Rails engine with Crowdfunding features, such as:
* Projects
* Project's Admin Interface
* Contributions
* Rewards
* Donations
* Profiles
* Admin Interface (Inspired by Rails Admin)
* Payment Gateways (Paypal, Stripe, etc)
* Style and Themes customization based on bootstrap

## Installing into a new Rails application
To get up and running with Hatchy in a new Rails application is simple. Just follow the instructions below.
		
		rails new my_project
		cd my_project
		echo "gem 'hatchy', '0.0.6.pre'" >> Gemfile
		bundle
		rails g hatchy:install
		rake db:migrate hatchy:setup
		rails server

## State of the project
The project is not production ready yet.
Currently working on 0.0.7.pre and the first release

## Documentation
auto-generated by yard

## Links
TO-DO:
* Payments Gateway with activemerchant
* Admin Projects
* Admin Users
* Admin Contributions
* Project's Posts and comments
* Project's admin metrics
* Project's Donations
* CronJobs for project's states
* Demo

## Contribution
If you'd like to help with this project, please get in touch with me. By e-mail to hugomarquez.dev@gmail.com

## Credits
Author: Hugo Márquez


## License
Hatchy is licenced under the MIT license. Full details can be found in the MIT-LICENSE file in the root of the repository.

## Dependencies
We do not try to reinvent the wheel, so this is built with open source projects:
* for complete list, check out the Gemfile/gemspec

Tool                  | Description
--------------------- | -----------
[CarrierWave]         | Simple and extremely flexible way to upload files from Ruby applications.
[Devise]              | Powerful, extensible user authentication
[Ruby]                | Open source programming language
[Rails]               | Open-source web framework

[CarrierWave]: https://github.com/carrierwaveuploader/carrierwave
[Devise]: https://github.com/plataformatec/devise
[Ruby]: https://www.ruby-lang.org/en/
[Rails]: http://rubyonrails.org/