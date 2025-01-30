module Shape

export Square
export Rectangle
export Triangle

export area

abstract type AbstractShape end
abstract type Polygon <: AbstractShape end
abstract type Irregular <: AbstractShape end

abstract type Quadrilateral <: Polygon end

struct Square <: Quadrilateral
	len::Float64
	Square(len::AbstractFloat) = len < 0 ? error("Length is less than 0.") : new(convert(Float64, len))
	Square(len::Integer) = len < 0 ? error("Length is less than 0.") : new(convert(Float64, len))
end

struct Rectangle <: Quadrilateral
	len::Float64
	width::Float64
	function Rectangle(len::T, width::Z) where T <: Union{AbstractFloat, Integer} where Z <: Union{AbstractFloat, Integer}
    	len < 0 && return error("Length is less than 0.")
    	width < 0 && return error("Width is less than 0.")
    	new(convert(Float64, len), convert(Float64, width))
	end
end

struct Triangle <: Polygon
    side1::Float64
    side2::Float64
    side3::Float64
    function Triangle(side1::T, side2::Z, side3::Y) where T <: Union{AbstractFloat, Integer} where Z <: Union{AbstractFloat, Integer} where Y <: Union{AbstractFloat, Integer}
    	side1 < 0 && return error("Side 1 is less than 0.")
    	side2 < 0 && return error("Side 2 is less than 0.")
    	side3 < 0 && return error("Side 3 is less than 0.")
    	new(convert(Float64, side1), convert(Float64, side2), convert(Float64, side3))
    end
end

area(shape::Square) = shape.len ^ 2
area(shape::Rectangle) = shape.len * shape.width
area(shape::Triangle) = begin
    s = (shape.side1 + shape.side2 + shape.side3) / 2
    sqrt(s * (s - shape.side1) * (s - shape.side2) * (s - shape.side3))
end

end # module Shape