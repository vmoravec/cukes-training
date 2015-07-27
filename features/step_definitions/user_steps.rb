Given(/^the user home directory exists$/) do
  expect(user.homedir.exist?).to eq(true)
end

Given(/^the config directory \.ssh exists$/) do
  @sshdir = user.homedir.join(".ssh")
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
