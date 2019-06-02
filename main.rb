require_relative './dependency'

library = LibraryGenerator.load_from_file
Output.show(library)
