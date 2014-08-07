require_relative 'spec_helper'

describe "index_controller" do 
	  describe "GET /" do 
	    it "responds successfully with an HTTP 200 status code" do
      # let user create new short URL, display a list of shortened URLs
	    get '/'

	    expect(last_response.status).to eq(200)
	  end
	end

	  describe "POST /" do
	    it "redirects back to index page" do 
	    post "/"

	    expect(last_response.status).to eq(302)	    
	  end
	end

	describe "POST /" do
		it "creates a new url" do
			Url.delete_all

			expect {
				post "/", original_link: "Something or other here..."
			}.to change{Url.count}
		end
	end

  # Write a test for the model method you created that generates the short URL.
	describe "POST /" do
	  it "should call shorten_link as a before_save callback" do
	  	url = Url.new
	  	url.run_callbacks(:save) {false} 
	  end
	end

end