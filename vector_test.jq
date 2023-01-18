import "jqunit" as t;

include "vector" {search: "."};

t::testsuite(
  (tuple(4.3; -4.2; 3.1; 1.0) |
  [
    t::test("x component of tuple is set"; x | t::assert_equals(4.3)),
    t::test("y component of tuple is set"; y | t::assert_equals(-4.2)),
    t::test("z component of tuple is set"; z | t::assert_equals(3.1)),
    t::test("w component of tuple is set"; w | t::assert_equals(1.0)),
    t::test("a point is a point"; t::assert(is_point)),
    t::test("a point is not a vector"; t::assert(is_vector | not))
  ]) +
  (tuple(4.3; -4.2; 3.1; 0.0) |
  [
    t::test("a vector is a vector"; t::assert(is_vector)),
    t::test("a vector is not a point"; t::assert(is_point | not))
  ]) +
  [
    t::test(
      "point creates a tuple with w=1";
      point(4; -4; 3) | t::assert_equals(tuple(4; -4; 3; 1))),
    t::test(
      "point creates a tuple with w=1";
      vector(4; -4; 3) | t::assert_equals(tuple(4; -4; 3; 0))),
    t::test(
      "Add two tuples";
      tuple(3; -2; 5; 1) | add(tuple(-2; 3; 1; 0)) |
      t::assert_equals(tuple(1; 1; 6; 1))),
    t::test(
      "Subtract two points";
      point(3; 2; 1) | subtract(point(5; 6; 7)) |
      t::assert_equals(vector(-2; -4; -6))),
    t::test(
      "Subtract a vector from a point";
      point(3; 2; 1) | subtract(vector(5; 6; 7)) |
      t::assert_equals(point(-2; -4; -6))),
    t::test(
      "Subtract two vectors";
      vector(3; 2; 1) | subtract(vector(5; 6; 7)) |
      t::assert_equals(vector(-2; -4; -6))),
    t::test(
      "Negate a tuple";
      tuple(1; -2; 3; -4) | negate |
      t::assert_equals(tuple(-1; 2; -3; 4))),
    t::test(
      "Multiply tuple by scalar";
      tuple(1; -2; 3; -4) | multiply(3.5) |
      t::assert_equals(tuple(3.5; -7; 10.5; -14))),
    t::test(
      "Multiply tuple by a fraction";
      tuple(1; -2; 3; -4) | multiply(0.5) |
      t::assert_equals(tuple(0.5; -1; 1.5; -2))),
    t::test(
      "Divide tuple by scalar";
      tuple(1; -2; 3; -4) | divide(2) |
      t::assert_equals(tuple(0.5; -1; 1.5; -2))),
    t::test(
      "Magnitude of vector(1, 0, 0)";
      vector(1; 0; 0) | magnitude |
      t::assert_equals(1)),
    t::test(
      "Magnitude of vector(0, 1, 0)";
      vector(0; 1; 0) | magnitude |
      t::assert_equals(1)),
    t::test(
      "Magnitude of vector(0, 0, 1)";
      vector(0; 0; 1) | magnitude |
      t::assert_equals(1)),
    t::test(
      "Magnitude of vector(1, 2, 3)";
      vector(1; 2; 3) | magnitude |
      t::assert_approximate(14 | sqrt)),
    t::test(
      "Magnitude of vector(-1, -2, -3)";
      vector(1; 2; 3) | magnitude |
      t::assert_approximate(14 | sqrt)),
    t::test(
      "Normalize vector(4, 0, 0)";
      vector(4; 0; 0) | normalize |
      t::assert_equals(vector(1; 0; 0))),
    t::test(
      "Normalize vector(1, 2, 3)";
      vector(1; 2; 3) | normalize |
      t::assert_approximate(vector(0.26726; 0.53452; 0.80178))),
    t::test(
      "Normalized vector(1, 2, 3) has magnitude 1";
      vector(1; 2; 3) | normalize | magnitude |
      t::assert_approximate(1)),
    t::test(
      "Dot product";
      vector(1; 2; 3) | dot(vector(2; 3; 4)) |
      t::assert_equals(20)),
    t::test(
      "Cross product";
      vector(1; 2; 3) | cross(vector(2; 3; 4)) |
      t::assert_equals(vector(-1; 2; -1))),
    t::test(
      "Cross product reversed";
      vector(2; 3; 4) | cross(vector(1; 2; 3)) |
      t::assert_equals(vector(1; -2; 1)))
  ]
)

