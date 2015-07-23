class User
  ROOT = "root"

  extend Forwardable

  def_delegators :@info, :uid, :gid

  attr_reader :login, :name, :homedir

  def initialize
    if Process.uid.zero?
      @login = ROOT
      @name = ROOT
      @homedir = "/" + ROOT
    else
      @login = Etc.getlogin
      @info = Etc.getpwnam(login)
      @name = detect_name
      @homedir = @info.dir
    end
  end

  def root?
    Process.uid.zero?
  end

  private

  def detect_name
    name = @info.gecos.split(',').first
    name.to_s.empty? ? login : name
  end
end
