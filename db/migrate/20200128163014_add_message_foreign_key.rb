class AddMessageForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :messages, :groups
  end
end
