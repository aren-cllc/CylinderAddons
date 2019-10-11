return function(formula, progress, icon, icons, zoom, screen_width, screen_height, icon_width)
    local cx, cy = screen_width / 2, screen_height / 2
    local prog = progress
    local ix = (icon - 0.5) / icons * screen_width - prog * screen_width
    local iy = cy

    local x = (ix - cx) / zoom

    local expression = function(a) return cy - load("return "..string.gsub(formula, "x", "("..a..")"))() end
    
    local result = {}
    result.x = ix -  0.5 * icon_width 
    result.y = expression(x) - 0.75 * icon_width
    result.r = math.atan(expression(x + 1 / zoom) - expression(x), 1 / zoom)
    return result
end
