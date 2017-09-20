require "rails_helper"

describe MainController do
	describe "index action" do
		it "test" do
			get :index, params: { q: 'sass' }
			print '>>>>>>>>>>>>>'
			puts response.location
		end
	end
end