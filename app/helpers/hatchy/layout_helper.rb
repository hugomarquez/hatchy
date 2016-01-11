module Hatchy::LayoutHelper

	def flash_messages(opts={})
		@layout_flash = opts.fetch(:layout_flash){true}
		capture do 
			flash.each do |name, msg|
				concat (
					content_tag :div, id:"flash", data:{type:"#{name}", message:"#{msg}"}, class: 'hidden' do 
						content_tag :p, "loading flash"
					end
				)
			end
		end
	end

	def navbar_type
		@nav_type.nil? ? 'navbar-static-top' : @nav_type
	end

	def show_layout_flash?
		@layout_flash.nil? ? true : @layout_flash
	end

	def show_layout_footer?
		@layout_footer.nil? ? true : @layout_footer
	end

end