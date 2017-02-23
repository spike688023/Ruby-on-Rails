class RemoveFilenameFromResumes < ActiveRecord::Migration
  def change
    remove_column :resumes, :filename, :string, :after => :attachment
  end
end
