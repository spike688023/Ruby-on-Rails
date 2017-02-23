class AddUseridToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :userid, :string
  end
end
