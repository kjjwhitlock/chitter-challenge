describe '.find' do
  it 'finds a user by ID' do
    user = User.create(email: "test@example.com", password: "password")
    result = User.find(id: user)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
  end
end
