class Quiz < ApplicationRecord
    # has_many :words



    def word_list 
        Word.where(id: self.words)
    end


end
