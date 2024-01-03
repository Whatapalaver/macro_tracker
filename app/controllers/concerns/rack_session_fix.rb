# with API only mode we’re not going to be using session cookies.
# This is an unfixed bug in Devise with Rails 7 at the moment.
# There’s an issue on the Devise-JWT repo that discusses this problem including a few fixes.
# Fix focuses on giving devise a fake rack session hash that has enabled? set to false to avoid the error that it would otherwise raise.

module RackSessionFix
  extend ActiveSupport::Concern
  class FakeRackSession < Hash
    def enabled?
      false
    end
  end
  included do
    before_action :set_fake_rack_session_for_devise

    private

    def set_fake_rack_session_for_devise
      request.env['rack.session'] ||= FakeRackSession.new
    end
  end
end
