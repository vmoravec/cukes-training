require "pathname"
require "etc"
require "forwardable"

class User
  ROOT = "root"

  extend Forwardable

  def_delegators :@info, :uid, :gid, :shell

  attr_reader :login, :name, :homedir

  def initialize
    @login = Process.uid.zero? ? ROOT : Etc.getlogin
    @info = Etc.getpwnam(login)
    @name = detect_name
    @homedir = Pathname.new(@info.dir)
  end

  def root?
    login == ROOT
  end

  private

  def detect_name
    name = @info.gecos.split(',').first
    name.to_s.empty? ? login : name
  end
end
