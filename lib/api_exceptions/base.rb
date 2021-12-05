module ApiExceptions
  class Base < StandardError
    include ActiveModel::Serialization

    # Standard JSONAPI attributes
    attr_accessor :status, :title, :detail, :code

    def initialize(status: nil, title: nil, detail: nil, code: nil)
      @status = status || '500'
      @title = title || 'Server Error'
      @detail = detail || 'an unexpected error was encountered'
      @code = code
    end

    def serializable_hash
      [{status: status, title: title, detail: detail, code: code}]
    end

    delegate :to_h, to: :serializable_hash
    delegate :to_s, to: :serializable_hash
  end
end
