class AddAttachmentImageToDirectors < ActiveRecord::Migration
  def self.up
    change_table :directors do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :directors, :image
  end
end
