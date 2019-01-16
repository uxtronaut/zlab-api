class JobSerializer < ActiveModel::Serializer
  attributes :id, :name, :started_at, :finished_at, :log, :errored_at
end
