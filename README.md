# SEARCH API BY STACKOVERFLOW.COM

This is a microservice with of WEB interface running on the stackoverflow.com service API. It also has its own versions of the API.

* Ruby version 2.3.1
* Without Data Base
* Rails version 5.1.4
* Foundation-rails version 6.4

### How does it work (WEB)?

Main Controller receives a GET request from a form on the main page and sends the stackoverflow API and displays on the main page. Example URL: http://localhost:3000/main?utf8=✓&q=sass&commit=Search, where 'q' = our request for stackoverflow API.

If the request does not exist or the query is empty - it will not be processed.
If the returned result will be empty - there will be a message "Sorry, not found".
If the API returned an error - the WEB version will display it as "Sorry, not found"

### How does it work (API)?

The API works on the same principle. To submit your request, you need to apply at: http://localhost:3000/api/v1/search/sass.
Here "sass" is your query. The Search controller will process it and return a JSON response.

Example JSON:

{"items":[{"creation_date":1302722589,"question_id":5654447,"link":"https://stackoverflow.com/questions/5654447/whats-the-difference-between-scss-and-sass","title":"What&#39;s the difference between SCSS and Sass?"},{...},....}

Here all founded the data provided by the "items".

If the request does not exist or the query is empty - {"error_id":404,"error_message":"Sorry, not found"}.

If the returned result will be empty - {"error_id":404,"error_message":"Sorry, not found"}.

If the API returned an error - {"error_id":ID,"error_message":"MESSAGE"}.
