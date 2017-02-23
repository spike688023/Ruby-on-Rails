class AddApknameToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :apkname, :string, after => :attachment
  end
end
