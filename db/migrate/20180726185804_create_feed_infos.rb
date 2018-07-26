class CreateFeedInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :feed_infos do |t|
      t.string :feed_publisher
      t.string :feed_publisher_url
      t.string :feed_lang
      t.date :feed_start_date
      t.date :feed_end_date
      t.string :feed_version

      t.timestamps
    end
  end
end
