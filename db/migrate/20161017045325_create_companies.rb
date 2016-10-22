class CreateCompanies < ActiveRecord::Migration[5.0]
    def change
        create_table :companies do |t|
            t.string :name
            t.string :phone
            t.string :email
            t.string :url
            t.string :short_description
            t.text :description
            t.attachment :image

            t.timestamps
        end
    end
end
