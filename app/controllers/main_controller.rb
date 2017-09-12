class MainController < ApplicationController
	def index

		# @users = {Name: :Ivan, Status: :Schoolboy}

		# respond_to do |format|
		# 	format.html # index.html.erb
		# 	format.xml {render xml: @users}
		# 	format.json {render json: @users}
		# end

		# http://api.stackexchange.com/2.2/search?order=desc&sort=relevance&intitle=how%20do&site=stackoverflow&filter=!Su916jdNbrmxot7gxi/
		@q = params[:q]
		@query = URI.escape("http://api.stackexchange.com/2.2/search?order=desc&sort=relevance&intitle=#{@q}&site=stackoverflow&filter=!Su916jdNbmxtsVd5Yq")
		
		@result = Net::HTTP.get(URI.parse(@query))
		@result = JSON.parse(@result)
		

	end
end
