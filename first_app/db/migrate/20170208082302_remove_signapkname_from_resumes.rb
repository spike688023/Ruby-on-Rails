class RemoveSignapknameFromResumes < ActiveRecord::Migration
  def change
    remove_column :resumes, :signapkname, :string
  end
end
