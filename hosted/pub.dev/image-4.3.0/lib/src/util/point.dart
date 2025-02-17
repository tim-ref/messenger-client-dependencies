/// 2-dimensional point
class Point {
  num x;
  num y;

  Point([this.x = 0, this.y = 0]);

  Point.from(Point other)
      : x = other.x,
        y = other.y;

  int get xi => x.toInt();
  int get yi => y.toInt();

  Point operator *(double s) => Point(x * s, y * s);

  Point operator +(Point rhs) => Point(x + rhs.x, y + rhs.y);

  @override
  bool operator ==(Object other) =>
      other is Point && x == other.x && y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}
