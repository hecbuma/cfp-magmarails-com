# This migration comes from cfp (originally 20121118223940)
class CreateCfpProposals < ActiveRecord::Migration
  def change
    create_table :cfp_proposals do |t|
      t.integer :user_id
      t.string  :title
      t.string  :level
      t.text    :abstract
      t.text    :description
      t.string  :language
      t.string  :tags


      t.timestamps
    end
  end
end
