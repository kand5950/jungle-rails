# Jungle

The Jungle web application is a mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. This project was meant to be an introduction to the role of a junior developer in the real world, where one could step into a new job and might need to learn a new tech stack.

I was provided with a pre built app in which I had to seek out and correct various errors. Errors that I fixed include the following:

Money formatting and adding dollar signs to all prices across the site.
Modified checkout cart page so that checkout button is only shown if items are in cart. If no items in cart user met with an "empty cart" message.
Added a sold out badge for when an item has 0 quantity.
Adjusted the order show page so that it displays line items in order, image, name, description, respective quantities, final amount for order and the email that was used for the purchase.
Implemented admin security using http basic authentication for admin related tasks (dashboard, product addition, category creation)
Added landing page for admin dashboard. Once logged in with http authentication, page demonstrates basic stats of how many products are in database and how many categories are in database.
Added an about page that provides more information about the store.
Added the ability to create new plant categories as an admin.
Added in user authentication, allowing user to register and login. All passwords are hashed using bcrypt.
Incorporated various RSPEC and Cypress tests to ensure various functions and app requirements worked correctly.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
