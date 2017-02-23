class RemoveApknameFromResumes < ActiveRecord::Migration
  def change
    remove_column :resumes, :apkname, :string
  end
end
