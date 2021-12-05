  class PokemonSerializer < ActiveModel::Serializer
    attribute :id
    attribute :name
    attribute :types

    has_many :types, serializer: TypeSerializer

    def id
      object.external_id
    end

    def types
      object.slots.each(&:type)
    end
  end
