namespace :db do
  desc "Add some sample users to database (with one admin)"
  
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(
      :email => 'james@example.org',
      :password => 'foobar',
      :password_confirmation => 'foobar'
      #:admin => true
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
    make_roles
    make_role_relationships
  end
end

def make_roles
  Role.create!(:name => "NormalUser")
  Role.create!(:name => "SuperAdmin")
end

def make_role_relationships
  normal_role = Role.find_by_name("NormalUser")
  sup_admin_role = Role.find_by_name("SuperAdmin")
  
  User.all.each do |user|
    User.update(user.id, :roles => [normal_role])
  end
  
  super_admin = User.find_by_email('james@example.org')
  User.update(super_admin.id, :roles => super_admin.roles << [sup_admin_role] )
  
end