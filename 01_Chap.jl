# using Plots
# # define the Lorenz attractor
# Base.@kwdef mutable struct Lorenz
#     dt::Float64 = 0.02
#     σ::Float64 = 10
#     ρ::Float64 = 28
#     β::Float64 = 8/3
#     x::Float64 = 1
#     y::Float64 = 1
#     z::Float64 = 1
# end

# function step!(l::Lorenz)
#     dx = l.σ * (l.y - l.x)
#     dy = l.x * (l.ρ - l.z) - l.y
#     dz = l.x * l.y - l.β * l.z
#     l.x += l.dt * dx
#     l.y += l.dt * dy
#     l.z += l.dt * dz
# end

# attractor = Lorenz()


# # initialize a 3D plot with 1 empty series
# plt = plot3d(
#     1,
#     xlim = (-30, 30),
#     ylim = (-30, 30),
#     zlim = (0, 60),
#     title = "Lorenz Attractor",
#     marker = 2,
# )

# # build an animated gif by pushing new points to the plot, saving every 10th frame
# @gif for i=1:1500
#     step!(attractor)
#     push!(plt, attractor.x, attractor.y, attractor.z)
# end every 10




using Images, ImageView, TestImages

directory_path = "./archive/no/";
directory_files = readdir(directory_path);
# print(directory_files)
directory_images = filter(x -> occursin(r"\.(jpg|png|gif){1}$"i, x), directory_files);

# print(directory_images)

for image_name in directory_images
    image_path = joinpath(directory_path, image_name)
    image = load(image_path)
    imshow(image)
    sleep(0.5)
    print(image_path)
end

image = testimage("mri")
imshow(image)
print("sleeping")
sleep(1)