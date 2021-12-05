module ApiExceptions
  class Serializer
    def initialize(error)
      @error = error
    end

    def to_json(_payload = nil)
      to_h.to_json
    end

    def to_h
      serializable_hash
    end

    private

    attr_reader :error

    def serializable_hash
      {
        errors: Array(error.serializable_hash),
      }
    end
  end
end
