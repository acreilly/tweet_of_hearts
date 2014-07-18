require 'spec_helper'

describe User do
  context "validations" do
    before(:each) do
      User.all.map(&:destroy)
    end
    it "doesn't add a record to the db" do
      params= {email: nil, first_name: 'ariel', password: '123456'}
      user = User.new(params)
      expect{user.save}.to_not change {User.count}
      expect(user).to be_invalid
    end

    it "displays the correct error message, 'can't be blank'" do
      params= {email: nil, first_name: 'ariel', password: '123456'}
      user = User.create(params)
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "only accepts valid email addresses" do
      params= {email: '1', first_name: 'parjam', password: '123456'}
      expect{User.create(params)}.to_not change {User.count}
      params[:email] = 'parjam@dbc.com'
      expect{User.create(params)}.to change {User.count}.by(1)
    end

    it "only creates records with unique email addresses" do
      params= {email: 'ariel@dbc.com', first_name: 'ariel', password: '123456'}
      User.create(params)
      expect{User.create(params)}.to_not change {User.count}
    end
  end
end
