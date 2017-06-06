def base_exponent(num, base)
  digits = %w[0 1 2 3 4 5 6 7 8 9]
  return '' if num == 0
  base_exponent(num/base, base) + digits[num % base]
end

base_exponent(36, 10)
