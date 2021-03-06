# @see https://developers.podio.com/doc/actions
class Podio::Action < ActivePodio::Base
  property :action_id, :integer
  property :type, :string
  property :data, :hash
  property :text, :string

  has_many :comments, :class => 'Comment'

  alias_method :id, :action_id

  class << self
    # @see https://developers.podio.com/doc/actions/get-action-1701120
    def find(id)
      member Podio.connection.get("/action/#{id}").body
    end
  end

end
