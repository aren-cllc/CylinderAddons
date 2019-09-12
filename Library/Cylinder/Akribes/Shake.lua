return function(page, offset, screen_width, screen_height)
    local percent = offset/page.width

    for i, icon in subviews(page) do
        icon:translate(math.sin(2 * math.pi * percent) * 35, 0, 0)
        --icon.alpha = math.min(math.max(1 - math.pow(percent, 2), 0), 1)
        --icon.alpha = 1 - math.abs(percent)
        if (percent >= 0) then
            icon.alpha = math.min(1, math.max(0, -8 * percent + 4.5))
        else
            icon.alpha = math.min(1, math.max(0, 8 * percent + 4.5))
        end
    end
    page:translate(offset, 0, 0)
end
