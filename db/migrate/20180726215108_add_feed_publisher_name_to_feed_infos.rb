class AddFeedPublisherNameToFeedInfos < ActiveRecord::Migration[5.2]
  def change
    remove_column :feed_infos, :feed_publisher
    add_column :feed_infos, :feed_publisher_name, :string
  end
end
