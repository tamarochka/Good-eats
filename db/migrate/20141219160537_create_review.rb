class CreateReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :rating
      t.text :body

      t.timestamps
    end
  end
end
