class Freebie < ActiveRecord::Base
    belongs_to :dev
    belongs_to :company

    def get_dev
        self.dev.name
    end

    def get_company
        self.company.name
    end

    def print_details
        "#{get_dev} owns a #{self.item_name} from #{get_company}"
    end
end
