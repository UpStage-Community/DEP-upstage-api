class CreateProductions < ActiveRecord::Migration[5.0]
    def change
        create_table :productions do |t|
            t.references :company
            t.string :title
            t.string :short_description
            t.text :description
            t.string :price_range
            t.string :ticket_url
            t.attachment :image

            t.timestamps
        end
    end
end
