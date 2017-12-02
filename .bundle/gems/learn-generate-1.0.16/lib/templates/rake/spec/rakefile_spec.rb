describe 'Rakefile' do
  it 'defines the starter task hello_world' do
    expect(Rake::Task[:hello_rake]).to be_an_instance_of(Rake::Task)
  end
end