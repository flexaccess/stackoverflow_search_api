class MainController < ApplicationController
	def index

		q = params[:q] || ''
		q = q.strip if q

		unless q.empty?
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

	end
end
