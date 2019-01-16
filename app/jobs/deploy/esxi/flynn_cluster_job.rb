class Deploy::Esxi::FlynnClusterJob < ApplicationJob
  queue_as :deployments

  def perform(cluster_id)
    cluster = Cluster.find(cluster_id)
    job_record = Job.create!(name: "Deploy Flynn Cluster: #{cluster.name}")
    job_log = ''

    file_path = Rails.root.join('test', 'fixtures', 'files', 'odyssey.txt')
    command = "tail -n +1 #{file_path}"

    IO.popen(command) do |io|
      while (line = io.gets) do
        ActionCable.server.broadcast 'job_output_channel', content: line
        job_log << line
      end
    end

    job_record.update!(log: job_log, finished_at: Time.now)
  end
end
