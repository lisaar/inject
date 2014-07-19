class Array


  def injection(*args, &block)
    if(args.size == 2)
      injection_binary_operation(args[0], args[1], self)
    elsif(args.size == 1 && !block_given?)
      injection_binary_operation(self.first, args[0], self.drop(1))
    else
      memo = args[0] || self.first
      self.each { |element| memo = yield(memo, element) if block_given?}
      memo
    end
  end


  def injection_binary_operation(memo, operator, array)
    raise TypeError.new("#{operator} is not a symbol") unless operator.is_a? Symbol
    array.each { |element| memo = memo.send(operator, element)}
    memo
  end

end

 