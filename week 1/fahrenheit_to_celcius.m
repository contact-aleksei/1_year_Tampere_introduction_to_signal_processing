x = 45;
y = fahrenh(x)
function y = fahrenh(x)
y = (x-32)*5/9;
offset = 0.05;
plot(x,y,'or'); xlabel('Fahrenheit'); ylabel('Celcius');
grid on;
caption = sprintf('x=%.2f, y=%.2f', x, y);%coordinates
text(x + offset, y + offset, caption, 'BackgroundColor', 'y');%coordinates
end
