module Aptible
  module Api
    class Account < Resource
      has_many :apps
      has_many :databases
      has_many :disks
      has_many :services

      def production?
        type == 'production'
      end

      def operations
        # TODO: Implement /accounts/:id/operations
        []
      end

      def organization
        auth = Aptible::Auth::Resource.new(token: token, headers: headers)
        auth.find_by_url(links['organization'].href)
      end
    end
  end
end
