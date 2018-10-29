class ChangeIntroductionToUsers < ActiveRecord::Migration[5.2]
  def up
  	change_column :Users, :introduction, :text, default:nil
  end

  def down
  	change_column :Users, :introduction, :text
  end
end
