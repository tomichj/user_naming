require "spec_helper"

class User
  include UserNaming::User
  attr_accessor :name
end

RSpec.describe UserNaming do
  it 'has a version number' do
    expect(UserNaming::VERSION).not_to be nil
  end

  context 'single part name' do
    before do
      @user = build(:user, name: 'Bilbo')
    end

    it 'has a first_name' do
      expect(@user.first_name).to eq 'Bilbo'
    end

    it 'has no last name' do
      expect(@user.last_name).to be_empty
    end

    it 'has initials' do
      expect(@user.initials).to eq 'B'
    end

    it 'has first name last initial' do
      expect(@user.first_name_last_initial).to eq 'Bilbo'
    end
  end

  context 'two part name' do
    before do
      @user = build(:user, name: 'Bilbo Baggins')
    end

    it 'has a first_name' do
      expect(@user.first_name).to eq 'Bilbo'
    end

    it 'has no last name' do
      expect(@user.last_name).to eq 'Baggins'
    end

    it 'has initials' do
      expect(@user.initials).to eq 'BB'
    end

    it 'has first name last initial' do
      expect(@user.first_name_last_initial).to eq 'Bilbo B.'
    end
  end

  context 'three part name' do
    before do
      @user = build(:user, name: 'Bilbo Foo Baggins')
    end

    it 'has a first_name' do
      expect(@user.first_name).to eq 'Bilbo'
    end

    it 'has no last name' do
      expect(@user.last_name).to eq 'Foo Baggins'
    end

    it 'has initials' do
      expect(@user.initials).to eq 'BFB'
    end

    it 'has first name last initial' do
      expect(@user.first_name_last_initial).to eq 'Bilbo B.'
    end
  end

end
