require_relative 'spec_helper'

require 'sequel'

Sequel.connect 'postgres://localhost/tests'

class User < Sequel::Model(:users)
  def change_email(email)
    update(email: email)
  end
end

describe User do
  def user
    @user ||= User.create(email: 'hello@example.com',
                      last_login: Time.new(2016, 10, 21, 10, 22))
  end

  it 'has some attributes' do
    user.email.should == 'hello@example.com'
    user.last_login.should == Time.new(2016, 10, 21, 10, 22)
  end

  it 'can change emails' do
    user.change_email('bob@example.com')
    user.email.should == 'bob@example.com'
  end

  it 'has some attributes' do
    user.to_hash.should == {
      id: user.id,
      email: 'bob@example.com',
      last_login: Time.new(2016, 10, 21, 10, 22),
      password: nil
    }
  end
end
