

get '/' do
  @all_urls = Url.all
  erb :index
end

post '/' do
	@url = Url.new
	@url.original_link = params[:original_link]
	@url.save
	redirect '/'
end

get '/:short_url' do
	p @found_url = Url.find_by(short_link: params[:short_url])
	redirect "#{@found_url.original_link}"
end