require 'spec_helper'

describe User do
  context "validations" do

    let(:params) {{email: nil, first_name: nil, password: nil}}
    it "doesn't add a record to the db" do
      user = User.new(params)
      expect{user.save}.to_not change {User.count}
      expect(user).to be_invalid
    end

    it "displays the correct error message, 'can't be blank'" do
      user = User.create(params)
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "only creates records with unique email addresses" do
      pending
    end

    it "only accepts valid email addresses" do
      pending
    end

    it "has a password with minimum length of 6 chars" do
      pending
    end
  end
end
