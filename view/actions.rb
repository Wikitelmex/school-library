module Actions
  def read_all
    raise 'Not implemented'
  end

  def create
    raise 'Not implemented'
  end

  private

  def wait
    print 'Press enter to continue...'
    gets.chomp
  end
end
