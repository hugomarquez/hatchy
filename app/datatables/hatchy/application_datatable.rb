module Hatchy
  class ApplicationDatatable
  	include ActionView::Context
		include ActionView::Helpers
		include Hatchy::Engine.routes.url_helpers

  end
end