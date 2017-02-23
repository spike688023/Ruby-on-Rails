class AddFilenameFromResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :filename, :string, :after => :attachment
  end
end
