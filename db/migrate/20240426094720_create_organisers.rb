class CreateOrganisers < ActiveRecord::Migration[7.1]
  def change
    create_table :organisers do |t|
      t.string :name
      t.string :url
      t.string :instagram
      t.string :facebook
      t.string :soundcloud

      t.timestamps
    end
  end
end
