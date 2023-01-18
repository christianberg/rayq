def tuple($x; $y; $z; $w):
  [$x, $y, $z, $w]
;

def x: .[0];
def y: .[1];
def z: .[2];
def w: .[3];

def is_point: w == 1;

def is_vector: w == 0;

def point($x; $y; $z): tuple($x; $y; $z; 1);

def vector($x; $y; $z): tuple($x; $y; $z; 0);

def add($other): [., $other] | transpose | map(add);

def multiply($factor): map(. * $factor);

def negate: multiply(-1);

def subtract($other): add($other | negate);

def divide($divisor): multiply(1/$divisor);

def magnitude: map(. * .) | add | sqrt;

def normalize: divide(magnitude);

def dot($other): [., $other] | transpose | map(.[0] * .[1]) | add;

def cross($other):
  vector(
    y * ($other | z) - z * ($other | y);
    z * ($other | x) - x * ($other | z);
    x * ($other | y) - y * ($other | x)
  )
;