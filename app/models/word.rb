class Word < ApplicationRecord

        def self.words
     pluck(:word)
  end
end
