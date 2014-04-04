#require './user_generator'
#require 'mongo'

module DataGenerator
  extend UserGenerator
  #extend Mongo

  class << self
    def config(server="localhost", port=27017)
      MongoClient.new(server, port)
    end

    def insert_users(database, collection, n, options={})
      coll = config.db(database)[collection]
      coll.insert generate_users(n)
    end

  end
end
