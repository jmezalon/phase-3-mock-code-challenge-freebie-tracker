class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def get_freebies
        self.freebies.item_name
    end

    def get_devs
        self.devs.name
    end

    def give_freebie(dev, item_name, value)
        Freebie.create(dev_id: dev.id, item_name: item_name, value: value, company_id: self.id)
    end

    def self.oldest_company
        Company.minimum(:founding_year)
    end
end
