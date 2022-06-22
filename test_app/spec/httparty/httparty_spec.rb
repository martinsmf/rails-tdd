describe "HTTParty" do
  # it "content-type" do
  #   response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/2")
  #   content_type = response.headers["content-type"]
  #   expect(content_type).to match(/application\/json/)
  # end

  # it "content-type webmock", vcr: { cassette_name: "jsonplaceholder/posts", match_requests_on: [:body] } do
  it "content-type webmock", vcr: { cassette_name: "jsonplaceholder/posts", :record => :new_episodes } do

    # stub_request(:get, "https://jsonplaceholder.typicode.com/posts/2").
    #   to_return(
    #   status: 200,
    #   body: "",
    #   headers: { 'content-type': "application/json; charset=utf-8" },
    # )
    # VCR.use_cassette("jsonplaceholder/posts") do
    # response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/#{[1, 2, 3, 4, 5].sample}")
    response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/3")
    content_type = response.headers["content-type"]
    expect(content_type).to match(/application\/json/)
    # end
  end
end
