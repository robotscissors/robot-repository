class DeleteDelayedJobs < ActiveRecord::Migration
  def change
    drop_table :delayed_jobs
  end
end