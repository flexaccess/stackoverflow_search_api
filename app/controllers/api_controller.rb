class ApiController < ApplicationController
	def index
		# {"error_id"=>502, "error_message"=>"too many requests from this IP, more requests available in 80050 seconds", "error_name"=>"throttle_violation"}
	end

	def show
		@id = params[:id]

		@query = URI.escape("http://api.stackexchange.com/2.2/search?order=desc&sort=relevance&intitle=#{@id}&site=stackoverflow&filter=!Su916jdNbmxtsVd5Yq")
		@result = Net::HTTP.get(URI.parse(@query))
		@answer = JSON.parse(@result)

		unless @answer['items'].nil?
			if @answer['items'].empty?
				@result = {'error_id' => 404, 'error_message' => 'Sorry, not found'}
			end
		else
			unless @answer['error_message'].empty?
				@result = {'error_id' => @answer['error_id'], 'error_message' => @answer['error_message']}
			end
		end

		respond_to do |format|
			format.html {render json: @result}
		end
	end
end