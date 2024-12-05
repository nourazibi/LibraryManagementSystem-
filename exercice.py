class Book:
    def __init__(self, title: str, author: str):
        self.title = title
        self.author = author
        self.is_available = True

    def __str__(self):
        return f"Title: {self.title} Author: {self.author} Available: {'Oui' if self.is_available else 'Non'}"


class Library:
    def __init__(self):
        self.books = []

    def add_book(self, title: str, author: str):
        book = Book(title, author)  
        self.books.append(book)

    def list_books(self):
        return [str(book) for book in self.books]

    def load_books(self, file_path: str):
        with open(file_path, 'r') as file:
            for line in file:
                title, author = line.strip().split(",")
                self.add_book(title, author)


class Student:
    def __init__(self, name: str):
        self.name = name
        self.borrowed_books = []

    def borrow_book(self, book_title: str, library: Library):
        if len(self.borrowed_books) >= 3:
            print(f"{self.name} a atteint la limite d'emprunt.")
            return
        for book in library.books:
            if book.title == book_title and book.is_available:
                book.is_available = False
                self.borrowed_books.append(book)
                print(f"{self.name} borrowed {book_title}")
                return
        print(f"{book_title} is not available.")

    def return_book(self, book_title: str, library: Library):
        for book in self.borrowed_books:
            if book.title == book_title:
                book.is_available = True
                self.borrowed_books.remove(book)
                print(f"{self.name} returned {book_title}")
                return
        print(f"{self.name} did not borrow {book_title}.")


def run_library_system():
    library = Library()
    student = Student("Nour Laazibi")

    while True:
        print("\nLibrary Menu")
        print("1. View all books")
        print("2. Search for a book")
        print("3. Add a new book")
        print("4. Borrow a book")
        print("5. Return a book")
       

        choice = input("Choose an option: ")

        if choice == "1":
            for book in library.list_books():
                print(book)
        elif choice == "2":
            query = input("Enter search query (title or author): ")
            result = library.search_books(query)
            for book in result:
                print(book)
        elif choice == "3":
            title = input("Enter book title: ")
            author = input("Enter book author: ")
            library.add_book(title, author)
        elif choice == "4":
            title = input("Enter book title to borrow: ")
            student.borrow_book(title, library) 
        elif choice == "5":
            title = input("Enter book title to return: ")
            student.return_book(title, library) 
            print("Exiting...")
            break
        else:
            print("Invalid option ,Please try again.")


if __name__ == "__main__":
    run_library_system()
