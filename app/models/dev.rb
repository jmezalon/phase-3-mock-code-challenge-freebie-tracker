class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def get_freebies
        self.freebies.item_name
    end

    def get_companies
        self.companies.name
    end

    def received_one?(item_name)
        self.freebies.where('item_name=?', item_name).length > 0 && true
    end

    def give_away(dev, freebie)
        freebie.update(dev_id: dev.id) if freebie.dev_id == self.id  
    end
end
