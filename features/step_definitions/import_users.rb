require 'open3'

Given 'there are no users in the database' do
  # NOOP
end

Given 'there are users in the database' do
  User.create!(name: 'Alixe', email: 'alice@example.com')
end

When 'I import a CSV file with name, email, and manager email' do
  csv = <<END
name,email,manager_email
Alice,alice@example.com,
Bob,bob@example.com,alice@example.com
Charlie,charlie@example.com,bob@example.com
END
  UserImporter.new(StringIO.new(csv)).import
end

Then 'new users with manager relationships should be created' do
  alice, bob, charlie = User.all.sort_by(&:name)

  expect(alice.name).to eq('Alice')
  expect(bob.name).to eq('Bob')
  expect(charlie.name).to eq('Charlie')

  expect(alice.email).to eq('alice@example.com')
  expect(bob.email).to eq('bob@example.com')
  expect(charlie.email).to eq('charlie@example.com')

  expect(alice.manager).to be_nil
  expect(bob.manager).to eq(alice)
  expect(charlie.manager).to eq(bob)
end

Then 'existing users should be updated' do
  alice = User.find_by(email: 'alice@example.com')

  expect(alice.name).to eq('Alice')
  expect(alice.manager).to be_nil
end

Then 'new users should be created' do
  alice, bob, charlie = User.all.sort_by(&:name)

  expect(bob.name).to eq('Bob')
  expect(charlie.name).to eq('Charlie')

  expect(bob.email).to eq('bob@example.com')
  expect(charlie.email).to eq('charlie@example.com')

  expect(bob.manager).to eq(alice)
  expect(charlie.manager).to eq(bob)
end
