import math

def check(a, b)
    assert(math.abs(a - b) < 1e-10)
end

def test_source(src, msg)
    try
        compile(src)
    except .. as e, m:
        assert(e == 'syntax_error')
        assert(m == 'string:1: ' + msg)
    end
end

compile('x = 5; 0..x')
assert(.45 == 0.45)
assert(0X10 == 16)
assert(0x10 == 16)
check(45., 45)
check(45.e-1, 4.5)
check(45.E-1, 4.5)
check(45.1e-1, 4.51)
check(45.1e2, 4510)
check(45.e2, 4500)
check(45.e+2, 4500)

test_source('x = 5; 0...x;', 'unexpected symbol near \'.\'')
test_source('x = 5; 0...x;', 'unexpected symbol near \'.\'')
test_source('45..', 'unexpected symbol near \'EOS\'')

var malformed_numbers = [
    '45f',
    '45.f',
    '45.ef',
    '45.e-f',
    '45.e-1f',
    '45.e-1.',
    '45.5.',
    '0x45.',
    '0x45.'
]

for (i : malformed_numbers)
    test_source(i, 'malformed number')
end
