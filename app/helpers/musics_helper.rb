module MusicsHelper

	    def music_params
			params.require(:music).permit(:title, :desc, :released, :description, :barcode, :stock, :can_order, :digital, :physical, :itunes, :composer_ids => [])
	    end

end
