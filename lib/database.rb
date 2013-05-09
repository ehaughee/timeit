require 'data_mapper'
require 'dm-timestamps'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV["DATABASE_URL"] || "sqlite3://#{Dir.pwd}/timeit.db")

# class User
#   include DataMapper::Resource

#   property :id,           Serial
#   property :username,     String
#   property :password,     String
#   property :admin,        Boolean

#   has n, :timers
# end

class Timer
  include DataMapper::Resource

  property :id,         Serial
  property :name,       String
  property :end,        DateTime
  property :created_at, DateTime
  property :updated_at, DateTime

  # belongs_to :user
end

DataMapper.finalize.auto_migrate!