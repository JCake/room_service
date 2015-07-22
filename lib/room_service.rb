require 'active_support/inflector'
require 'room_service/version'

module RoomService
  def require_const(const_name, path)
    require path

    const_defined?(const_name)
  rescue Exception
    false
  end

  def const_missing(const_name)
    catch(:loaded) do
      formal_name = ActiveSupport::Inflector.underscore(const_name.to_s)
      common_informal_name = formal_name.gsub(/_/, '')

      throw(:loaded) if require_const(const_name, formal_name)
      throw(:loaded) if require_const(const_name, common_informal_name)

      Gem.install(formal_name) rescue nil
      Gem.install(common_informal_name) rescue nil

      throw(:loaded) if require_const(const_name, formal_name)
      throw(:loaded) if require_const(const_name, common_informal_name)

      return super(const_name)
    end

    const_get(const_name)
  rescue Exception
    super(const_name)
  end
end

Module.prepend(RoomService)