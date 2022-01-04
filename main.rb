require './uiapp'

def main
  books = []
  people = []
  ui_app = UiApp.new(books, people)

  loop do
    system 'clear'
    system 'cls'
    puts 'Welcome to the library!'
    option = ui_app.options
    break if option > 6

    ui_app.do_action(option)
  end
end

main
