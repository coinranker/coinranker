Dir["#{Rails.root}/lib/coinranker/http_persistent.rb"].each(&method(:require))
Dir["#{Rails.root}/lib/coinranker/*_connector.rb"].each(&method(:require))