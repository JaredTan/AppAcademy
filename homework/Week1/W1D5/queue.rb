class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue(el)
    @queue.pop
  end

  def show
    @queue
  end

end
