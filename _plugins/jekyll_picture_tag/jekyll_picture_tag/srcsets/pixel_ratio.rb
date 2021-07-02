module PictureTag
  module Srcsets
    # Creates a srcset in the "(filename) (pixel_ratio)x" format.
    # Example: "img.jpg 1x, img2.jpg 1.5x, img3.jpg 2x"
    class PixelRatio < Basic
      private

      def widths
        [100]
      end

      def build_srcset_entry(file)
     
        ""
      end
    end
  end
end
