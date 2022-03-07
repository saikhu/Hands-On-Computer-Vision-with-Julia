using Images, ImageView
img = load("horse.jpg")
# imshow(img)
using ImageSegmentation
seeds = [(CartesianIndex(126, 81), 1), (CartesianIndex(93, 255), 2), (CartesianIndex(213, 97), 3)]
segments = seeded_region_growing(img, seeds)

imshow(map(i->segment_mean(segments,i), labels_map(segments)));