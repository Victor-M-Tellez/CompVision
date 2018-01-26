# CompVision


1. The Canny Edge Detector
1A.Smoothing: Smooth the image with a Gaussian filter with spread sigma
1B.Gradient:Compute gradient magnitude and direction at each pixel of the smoothed image
1C.Thresholding:Threshold the gradient magnitude image such that strong edges are kept and noise is suppressed
1D.Non-maximumsuppression(thinning):Zero out all pixels that are not the maximum along the direction of the gradient (look at 1 pixel on each side)
1E.Tracing edges:Trace high-magnitude contours and keep only pixels along these contours, so weak little segments go away
