#kmvc 밑에 있는 모든 library들을 한번에 require하는 방법.
Dir["#{Rails.root}/lib/coinranker/numeric_*"].each(&method(:require))
require 'coinranker/active_record_extension'
