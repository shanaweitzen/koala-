require 'spec_helper'

describe 'users resource' do 
		it 'routes /users/new to users#new' do
			expect(get: '/users/new').to route_to(
				controller: 'users',
				action: 'new'
			)
	end
end