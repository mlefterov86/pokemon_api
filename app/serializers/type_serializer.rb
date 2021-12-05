class TypeSerializer < ActiveModel::Serializer
  attribute :id
  attribute :name
  attribute :slot

  def id
    object.type.external_id
  end

  def name
    object.type.name
  end
end
