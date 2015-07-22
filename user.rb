class User
  extend Forwardable

  def_delegators :@info, :uid, :gid

  attr_reader :login, :name, :homedir

  def initialize
    if Process.uid.zero?
      @login = "root"
      @name = "root"
      @homedir = "/root/"
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
