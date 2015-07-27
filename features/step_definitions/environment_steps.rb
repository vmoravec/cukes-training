Given(/^the user home directory exists$/) do
  user = User.new
  @homedir = Pathname.new(user.homedir)
  expect(@homedir.exist?).to be_truthy
end

Given(/^the local ssh config directory "([^"]*)" exists$/) do |arg1|
  @sshdir = @homedir.join(".ssh")
end

Then(/^I get an non\-empty list$/) do
  expect(@files.size.nonzero?).to be_truthy
end

When(/^I list the content of ssh config dir$/) do
  @ssh_files = @sshdir.children
end

Then(/^I get an non\-empty list of entries$/) do
  expect(@ssh_files.size.nonzero?).to be_truthy
end

Then(/^I can find at least on pair of ssh keys$/) do
  [ /\Aid_(rsa|dsa).pub$/, /\Aid_(rsa|dsa)$/ ].each do |key|
    expect(@ssh_files.map(&:basename).map(&:to_s).grep(key)).not_to be_empty
  end
end

Given(/^the home directory is not empty$/) do
  expect(@homedir.children.size.nonzero?).to be_truthy
end
