shared_examples "an ok request" do
  it 'responds with a 200 code' do
    expect(last_response).to be_ok
  end
end