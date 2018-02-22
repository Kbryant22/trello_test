require 'spec_helper'
require 'rspec/rails'
describe 'Trello Test Set' do
  it 'should create a new Trello board' do
  	visit '/'  	

	click_link 'use-password'
	fill_in('user', :with => "#{$ACCT_USERNAME}")
	fill_in('password', :with => "#{$ACCT_PASSWORD}")
	click_button 'login' 

post 'https://api.trello.com/1/boards/?lists=open&list_fields=name&fields=name,desc&key=01b4f044113307c0ab9413f7b65f551d&token=e908b8b8f36accd6bc9edf615d81b24b8808e56c74bf15a9b699e232bfba1d84', { :name => 'Test Board 1'}
    expect_json_types(name: :string)
    expect_json(name: 'Test Board 1')
    expect_status(200)
	end


    it 'should create a new card name' do
	visit '/'  	

	click_link 'use-password'
	fill_in('user', :with => "#{$ACCT_USERNAME}")
	fill_in('password', :with => "#{$ACCT_PASSWORD}")
	click_button 'login' 
	fill_in('list-header-target js-editing-target', :with => 'Keith TO DO')
	click_link 'board-tile-details-name'
	click_link 'open-card-composer js-open-card-composer'
	fill_in('list-card-composer-textarea js-card-title', :with => 'Finish Trello API')
	click_link 'list-card-title js-card-name'

	expect_status(200)

	expect(page).has_content? ('Keith TO DO')
	end
end



 
