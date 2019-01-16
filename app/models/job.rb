class Job
  include Mongoid::Document

  field :_id, type: String, default: ->{ SecureRandom.uuid }
  field :name, type: String
  field :started_at, type: DateTime, default: ->{ Time.now }
  field :finished_at, type: DateTime
  field :errored_at, type: DateTime
  field :log, type: String
end
