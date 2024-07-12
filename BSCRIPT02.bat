@echo off
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
set /p choice=Enter your choice (1-3): 
if %choice% equ 1 (
    set /p radius=Enter the radius of the circle: 
    set /a area=3*%radius%*%radius%
    echo The area of the circle is: %area%
) else if %choice% equ 2 (
    set /p side1=Enter the length of side 1: 
    set /p side2=Enter the length of side 2: 
    set /p side3=Enter the length of side 3: 
    set /a s=(%side1%+%side2%+%side3%)/2
    set /a area= %s%*(%s%-%side1%)*(%s%-%side2%)*(%s%-%side3%)
    if %side1% equ %side2% if %side2% equ %side3% (
        echo This is an equilateral triangle.
    ) else if %side1% equ %side2% if %side2% neq %side3% (
        echo This is an isosceles triangle.
    ) else if %side1% equ %side3% if %side3% neq %side2% (
        echo This is an isosceles triangle.
    ) else if %side2% equ %side3% if %side3% neq %side1% (
        echo This is an isosceles triangle.
    ) else (
        echo This is a scalene triangle.
    )
    echo The area of the triangle is: %area%
) else if %choice% equ 3 (
    set /p length=Enter the length of the quadrilateral: 
    set /p width=Enter the width of the quadrilateral: 
    set /a area=%length%*%width%
    if %length% equ %width% (
        echo This is a square.
    ) else (
        echo This is a rectangle.
    )
    echo The area of the quadrilateral is: %area%
) else (
    echo Invalid choice. Please select a valid option.
)
