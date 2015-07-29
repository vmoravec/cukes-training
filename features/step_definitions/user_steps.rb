Given(/^the user home directory exists$/) do
  expect(user.homedir.exist?).to eq(true)
end

Given(/^the config directory \.ssh exists$/) do
  @sshdir = user.homedir.join(".ssh")
end

When(/^I list the content of ssh config dir$/) do
  @ssh_files = @sshdir.children.map(&:basename).map(&:to_s)
end

Then(/^I get an non\-empty list of entries$/) do
  expect(@ssh_files.size.nonzero?).to be_truthy
end

Then(/^the public key "([^"]*)" is present$/) do |key|
  expect(@ssh_files).to include(key)
end

Then(/^the private key "([^"]*)" is present$/) do |key|
  expect(@ssh_files).to include(key)
end
