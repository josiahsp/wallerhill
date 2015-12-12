module MusicsHelper

	    def music_params
			params.require(:music).permit(:title, :desc, :released, :description, :barcode, :stock, :can_order, :digital, :physical, :itunes, :price, :composer_ids => [])
	    end

end
