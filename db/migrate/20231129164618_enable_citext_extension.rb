class EnableCitextExtension < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'citext' unless extensions.include?('citext')
  end
end
