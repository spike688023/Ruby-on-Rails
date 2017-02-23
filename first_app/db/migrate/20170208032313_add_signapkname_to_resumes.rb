class AddSignapknameToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :signapkname, :string
  end
end
