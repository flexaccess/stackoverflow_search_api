# SEARCH API BY STACKOVERFLOW.COM

This is a microservice with of WEB interface running on the stackoverflow.com service API. It also has its own versions of the API.

* Ruby version 2.3.1
* Rails version 5.1.4
* Foundation-rails version 6.4
* Without Data Base

### How does it work (WEB)?

Main Controller receives a GET request from a form on the main page `http://localhost:3000/` and sends the stackoverflow API and displays.

Example GET request: `http://localhost:3000/main?utf8=✓&q=sass&commit=Search`, where `q` it's our request for stackoverflow API.

Request       | Answer SO API    | Main Controller
------------- | ---------------- | ---------------
`Not exist`   | `Not processed`  | `Not processed`
`Empty`       | `Not processed`  | `Not processed`
`Not Empty`   | `Items['Data']`  | `Display Data`
`Not Empty`   | `Items[]`        | `Display 'not found'`
`Not Empty`   | `Error_id`       | `Display 'not found'`
 
### How does it work (API)?

####Versions API:

Version       | Date  
------------- | ----------------
v1            | 20.09.2017


----------

The API works on the same principle. To submit your request, you need to apply at: `http://localhost:3000/api/v1/search/sass`.
Here `sass` is our query. The Search controller will process it and return a JSON response.

The example is **not empty** and **the existing** JSON response:

    {
    	"items":[
    		{"creation_date":1302722589,"question_id":5654447,"link":"https://stackoverflow.com/questions/5654447/whats-the-difference-between-scss-and-sass","title":"What is the difference between SCSS and Sass?"},
    		{...},{...},{...}
    	]
    }

Here all founded the data provided by the `items`.

Request       | Answer SO API    | Main Controller
------------- | ---------------- | ---------------
`Not exist`   | `Not processed`  | `{"error_id":404,"error_message":"Sorry, not found"}`
`Empty`       | `Not processed`  | `{"error_id":404,"error_message":"Sorry, not found"}`
`Not Empty`   | `Items['Data']`  | `{"Items":[{...}, {...}, {...}]}`
`Not Empty`   | `Items[]`        | `{"error_id":404,"error_message":"Sorry, not found"}`
`Not Empty`   | `Error_id`       | `{"error_id":ID,"error_message":"MESSAGE"}`