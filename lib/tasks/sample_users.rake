namespace :db do
  desc "Add some sample users to database (with one admin)"
  
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(
      :email => 'james@example.org',
      :password => 'foobar',
      :password_confirmation => 'foobar',
      :admin => true
    )
    9.times do |n|
      email = "example-#{n+1}@example.org"
      password = "password"
      User.create!(
        :email => email,
        :password => password,
        :password_confirmation => password
      )
    end
  end
end