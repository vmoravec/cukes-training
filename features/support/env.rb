require_relative "../../user"
require "pathname"
require "ostruct"

World do
  OpenStruct.new(user: User.new)
end

