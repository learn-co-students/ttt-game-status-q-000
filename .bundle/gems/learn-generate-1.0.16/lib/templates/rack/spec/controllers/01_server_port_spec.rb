describe 'ServerPort Middleware' do
  def app
    ServerPort.new(Application.new)
  end
  
  it_behaves_like "an ok request"

  it 'adds the server port to the response' do
    expect(last_response.body).to include("80")
  end
end