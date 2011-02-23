class CreateUrlJobs < ActiveRecord::Migration
 def self.up
    create_table :url_jobs, :force => true do |t|
      t.string   :token, :limit => 60              # The unique token for looking up this entry.
      t.integer  :action_limit, :default => 0      # The number of times the action can be executed when url visited.
      t.integer  :action_count, :default => 0      # The number of times the action has been executed when url visited.
      t.text     :handler                          # YAML-encoded string of the object that will do work
      t.timestamps
    end

    add_index :url_jobs, [:token]
  end

  def self.down
    drop_table :url_jobs
  end
end
