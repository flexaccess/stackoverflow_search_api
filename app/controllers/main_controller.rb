class MainController < ApplicationController
	def index

		# @users = {Name: :Ivan, Status: :Schoolboy}

		# http://api.stackexchange.com/2.2/search?order=desc&sort=relevance&intitle=how%20do&site=stackoverflow&filter=!Su916jdNbrmxot7gxi/
		q = params[:q]

		if q && q.empty? == false
			query = URI.escape("http://api.stackexchange.com/2.2/search?order=desc&sort=relevance&intitle=#{q}&site=stackoverflow&filter=!Su916jdNbmxtsVd5Yq")
			@result = Net::HTTP.get(URI.parse(query))
			@result = JSON.parse(@result)

			unless @result['items'].empty?
				@result = @result['items']
			else
				@result = []
			end
		else
			@result = false
		end

		respond_to do |format|
		format.html # index.html.erb
		format.xml {render xml: @result}
		format.json {render json: @result}
		end

end
end
