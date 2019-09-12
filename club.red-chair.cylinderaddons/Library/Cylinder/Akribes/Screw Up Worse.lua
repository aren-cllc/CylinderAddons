-- Effect that randomizes the position of all icons even more than "Screw Up" does
return function(page, offset, screen_width, screen_height)
    local max_x = 0.1 * screen_width
    local max_y = 0.1 * screen_height
    local max_z = 1000
    
    for i, icon in subviews(page) do
        icon:translate(math.random(-max_x, max_x), math.random(-max_y, max_y), math.random(0, max_z))
    end
    page:translate(offset, 0, 0)
end
